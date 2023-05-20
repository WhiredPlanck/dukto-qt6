#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <QLocale>
#include <QTranslator>

#include "model/recentlistitemmodel.h"
#include "model/buddylistitemmodel.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    QTranslator translator;
    const QStringList uiLanguages = QLocale::system().uiLanguages();
    for (const QString &locale : uiLanguages) {
        const QString baseName = "dukto-qt6_" + QLocale(locale).name();
        if (translator.load(":/i18n/" + baseName)) {
            app.installTranslator(&translator);
            break;
        }
    }

    QQmlApplicationEngine engine;

    BuddyListItemModel buddyListItemModel;
    RecentListItemModel recentListItemModel;

    buddyListItemModel.addMeElement();
    buddyListItemModel.addIPElement();

    engine.rootContext()->setContextProperty("buddiesListItemModel", &buddyListItemModel);
    engine.rootContext()->setContextProperty("recentListItemModel", &recentListItemModel);

    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
