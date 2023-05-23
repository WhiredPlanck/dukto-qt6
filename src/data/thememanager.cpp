#include "thememanager.h"

#include <QDebug>
#include <QColor>

const QString ThemeManager::DEFAULT_THEME_COLOR = "#248b00"; // green

ThemeManager::ThemeManager(QObject *parent) :
    QObject(parent),
    colorPrimary_(DEFAULT_THEME_COLOR), colorAccent_("#4cb328") // lime
{
}

void ThemeManager::setThemeColor(QString color)
{
    QColor c;
    c.setNamedColor(color);
    c.setRed(qMin(c.red() + 40, 255));
    c.setGreen(qMin(c.green() + 40, 255));
    c.setBlue(qMin(c.blue() + 40, 255));

    colorPrimary_ = color;
    colorAccent_ = c.name();
    emit colorPrimaryChanged();
    emit colorAccentChanged();
}

float ThemeManager::getHue(QString color) {

    QColor c;
    c.setNamedColor(color);
    QColor converted = c.toHsv();
    return converted.hsvHueF();
}

float ThemeManager::getSaturation(QString color) {

    QColor c;
    c.setNamedColor(color);
    QColor converted = c.toHsv();
    return converted.hsvSaturationF();
}

float ThemeManager::getLightness(QString color) {

    QColor c;
    c.setNamedColor(color);
    QColor converted = c.toHsv();
    return converted.valueF();
}
