#include <QQmlContext>
#include <QDesktopServices>
#include <QDir>
#include "enginerunner.h"


EngineRunner::EngineRunner(QGuiApplication *app, QQmlApplicationEngine *engine) :
    QObject(nullptr), engine_(engine)
{
    buddyListItemModel_.addMeElement();
    buddyListItemModel_.addIPElement();

    // register C++ class for QML
    engine->rootContext()->setContextProperty("engineRunner", this);
    engine->rootContext()->setContextProperty("buddyListItemModel", &buddyListItemModel_);
    engine->rootContext()->setContextProperty("recentListItemModel", &recentListItemModel_);
    engine->rootContext()->setContextProperty("ipAddressItemModel", &ipAddressItemModel_);

    engine->rootContext()->setContextProperty("appSettings", &appSettings_);
    engine->rootContext()->setContextProperty("themeManager", &themeManager_);

    // register singleton(s)
    engine->rootContext()->setContextProperty("ColorSingleton", &colorSingleton_);

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

QString EngineRunner::overlayState() {
    return overlayState_;
}

void EngineRunner::setOverlayState(QString state) {
    if (state == overlayState_) {
        return;
    }
    overlayState_ = state;
    emit overlayStateChanged();
}
