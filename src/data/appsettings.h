#ifndef APPSETTINGS_H
#define APPSETTINGS_H

#include <QObject>
#include <QSettings>

class AppSettings : public QObject
{
    Q_OBJECT

    Q_PROPERTY(bool showTermsOnStart READ showTermsOnStart WRITE setShowTermsOnStart NOTIFY showTermsOnStartChanged)
    Q_PROPERTY(QString themeColorPrimary READ themeColorPrimary WRITE setThemeColorPrimary NOTIFY themeColorPrimaryChanged)
    Q_PROPERTY(QString currentRecevieDirectory READ currentRecevieDirectory WRITE setCurrentRecevieDirectory NOTIFY currentRecevieDirectoryChanged)
public:
    explicit AppSettings(QObject *parent = nullptr);

    bool showTermsOnStart();
    void setShowTermsOnStart(bool flag);

    QString themeColorPrimary();
    void setThemeColorPrimary(QString colorPrimary);

    QString currentRecevieDirectory();
    void setCurrentRecevieDirectory(QString dir);

signals:
    void showTermsOnStartChanged();
    void themeColorPrimaryChanged();
    void currentRecevieDirectoryChanged();

private:
    QSettings settings_;

};

#endif // APPSETTINGS_H
