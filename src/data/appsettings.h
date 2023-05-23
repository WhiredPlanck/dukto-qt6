#ifndef APPSETTINGS_H
#define APPSETTINGS_H

#include <QObject>
#include <QSettings>

class AppSettings : public QObject
{
    Q_OBJECT

    Q_PROPERTY(bool showTermsOnStart READ showTermsOnStart WRITE setShowTermsOnStart NOTIFY showTermsOnStartChanged)
public:
    explicit AppSettings(QObject *parent = nullptr);

    bool showTermsOnStart();
    void setShowTermsOnStart(bool flag);

signals:
    void showTermsOnStartChanged();

private:
    QSettings settings_;

};

#endif // APPSETTINGS_H
