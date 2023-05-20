#ifndef PEER_H
#define PEER_H

#include <QHostInfo>

class Peer {
public:
    QHostAddress address;
    QString name;
    qint16 port;

    Peer() {}
    inline Peer(QHostAddress a, QString n, qint16 p) {
        address = a;
        name = n;
        port = p;
    }
};

#endif // PEER_H
