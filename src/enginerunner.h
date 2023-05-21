#ifndef ENGINERUNNER_H
#define ENGINERUNNER_H

#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "model/recentlistitemmodel.h"
#include "model/buddylistitemmodel.h"
#include "model/ipaddressitemmodel.h"

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

signals:
    void overlayStateChanged();

private:
    QQmlApplicationEngine *engine_;

    BuddyListItemModel buddyListItemModel_;
    RecentListItemModel recentListItemModel_;
    IPAddressItemModel ipAddressItemModel_;

    QString overlayState_;
};

#endif // ENGINERUNNER_H
