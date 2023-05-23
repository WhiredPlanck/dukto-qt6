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
}
