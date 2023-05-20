#ifndef OS_H
#define OS_H

#include <QString>
#include <QHostInfo>
#include <QSysInfo>

namespace dukto::os {

inline QString userName() {
    return qEnvironmentVariable("USERNAME",
                                qEnvironmentVariable("USER", "Unknow"));
}

inline QString hostName() {
    return QHostInfo::localHostName();
}

inline QString osName() {
    return QSysInfo::prettyProductName();
}

}

#endif // OS_H
