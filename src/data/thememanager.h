#ifndef THEMEMANAGER_H
#define THEMEMANAGER_H

#include <QObject>

class ThemeManager : public QObject
{
    Q_OBJECT
    
    Q_PROPERTY(QString colorPrimary READ colorPrimary NOTIFY colorPrimaryChanged)
    Q_PROPERTY(QString colorAccent READ colorAccent NOTIFY colorAccentChanged)

public:
    explicit ThemeManager(QObject *parent = nullptr);
    inline QString colorPrimary() { return colorPrimary_; }
    inline QString colorAccent() { return colorAccent_; }
    Q_INVOKABLE void setThemeColor(QString color);

    static const QString DEFAULT_THEME_COLOR;

signals:
    void colorPrimaryChanged();
    void colorAccentChanged();

public slots:
    float getHue(QString color);
    float getSaturation(QString color);
    float getLightness(QString color);

private:
    QString colorPrimary_; // color 2
    QString colorAccent_; // color 3

};

#endif // THEMEMANAGER_H
