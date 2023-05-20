#include <QQmlContext>
#include <QDesktopServices>
#include <QDir>
#include "enginerunner.h"


EngineRunner::EngineRunner(QGuiApplication *app, QQmlApplicationEngine *engine) :
    QObject(nullptr), engine_(engine)
{
    buddyListItemModel.addMeElement();
    buddyListItemModel.addIPElement();

    // register C++ class for QML
    engine->rootContext()->setContextProperty("engineRunner", this);
    engine->rootContext()->setContextProperty("buddyListItemModel", &buddyListItemModel);
    engine->rootContext()->setContextProperty("recentListItemModel", &recentListItemModel);

    // load GUI
    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));
    QObject::connect(engine, &QQmlApplicationEngine::objectCreated,
        app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine->load(url);
}

void EngineRunner::openRecevieDirectory() {
    QDesktopServices::openUrl(QUrl::fromLocalFile(QDir::currentPath()));
}
