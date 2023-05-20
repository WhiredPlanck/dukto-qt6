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
    return
#if defined(Q_OS_WIN)
        "Windows";
#elif defined(Q_OS_MACOS)
        "macOS";
#elif defined(Q_OS_LINUX)
        "Linux";
#else
        "Unknown";
#endif
}

}

#endif // OS_H
