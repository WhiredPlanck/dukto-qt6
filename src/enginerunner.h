#ifndef ENGINERUNNER_H
#define ENGINERUNNER_H

#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "model/recentlistitemmodel.h"
#include "model/buddylistitemmodel.h"
#include "model/ipaddressitemmodel.h"

#include "data/appsettings.h"
#include "data/thememanager.h"
#include "data/colorsingleton.h"

class EngineRunner : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString overlayState READ overlayState WRITE setOverlayState NOTIFY overlayStateChanged)

public:
    explicit EngineRunner(QGuiApplication *app, QQmlApplicationEngine *engine);

    QString overlayState();
    void setOverlayState(QString state);

    // called by QML
    Q_INVOKABLE void openRecevieDirectory();
    Q_INVOKABLE void changeRecevieDirectory();

signals:
    void overlayStateChanged();

private:
    QQmlApplicationEngine *engine_;

    BuddyListItemModel buddyListItemModel_;
    RecentListItemModel recentListItemModel_;
    IPAddressItemModel ipAddressItemModel_;

    AppSettings appSettings_;
    ThemeManager themeManager_;

    ColorSingleton colorSingleton_;

    QString overlayState_;
};

#endif // ENGINERUNNER_H
