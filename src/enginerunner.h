#ifndef ENGINERUNNER_H
#define ENGINERUNNER_H

#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "model/recentlistitemmodel.h"
#include "model/buddylistitemmodel.h"

class EngineRunner : public QObject
{
    Q_OBJECT
public:
    explicit EngineRunner(QGuiApplication *app, QQmlApplicationEngine *engine);

    // called by QML
    Q_INVOKABLE void openRecevieDirectory();

private:
    QQmlApplicationEngine *engine_;

    BuddyListItemModel buddyListItemModel;
    RecentListItemModel recentListItemModel;
};

#endif // ENGINERUNNER_H
