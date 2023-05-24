#include <QDir>
#include <QStandardPaths>
#include "appsettings.h"

AppSettings::AppSettings(QObject *parent)
    : QObject(parent), settings_("msec.it", "Dukto")
{

}

bool AppSettings::showTermsOnStart() {
    return settings_.value("showTermsOnStart", true).toBool();
}

void AppSettings::setShowTermsOnStart(bool flag) {
    settings_.setValue("showTermsOnStart", flag);
    settings_.sync();
    emit showTermsOnStartChanged();
}

QString AppSettings::themeColorPrimary() {
    return settings_.value("themeColorPrimary").toString();
}

void AppSettings::setThemeColorPrimary(QString colorPrimary) {
    settings_.setValue("themeColorPrimary", colorPrimary);
    settings_.sync();
    emit themeColorPrimaryChanged();
}

QString AppSettings::currentRecevieDirectory() {
    QString store = settings_.value("currentRecevieDirectory").toString();

    if (!store.isEmpty() && QDir(store).exists()) return store;

    QString defaultPath = // we return the download location for default path
        QStandardPaths::writableLocation(QStandardPaths::DownloadLocation);

    return QDir(defaultPath).exists() ? defaultPath : ".";
}

void AppSettings::setCurrentRecevieDirectory(QString dir) {
    settings_.setValue("currentRecevieDirectory", dir);
    settings_.sync();
    emit currentRecevieDirectoryChanged();
}
