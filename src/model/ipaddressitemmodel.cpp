#include <QHostAddress>
#include <QNetworkInterface>

#include "ipaddressitemmodel.h"
#include "utils/utilities.h"

IPAddressItemModel::IPAddressItemModel() :
    QStandardItemModel(nullptr)
{
    QHash<int, QByteArray> roleNames;
    roleNames[dukto::toUType(IPRoles::IP)] = "ip";
    setItemRoleNames(roleNames);

    refreshIPList();
}

void IPAddressItemModel::addIP(QString ip)
{
    QStandardItem* it = new QStandardItem();
    it->setData(ip, dukto::toUType(IPRoles::IP));
    appendRow(it);
}

void IPAddressItemModel::refreshIPList()
{
    // Clear current IP list
    clear();

    // Load IP list
    QList<QHostAddress> addrs = QNetworkInterface::allAddresses();
    foreach (QHostAddress addr, addrs) {
        if ((addr.protocol() == QAbstractSocket::IPv4Protocol)
            && (addr.toString() != "127.0.0.1"))
        {
            addIP(addr.toString());
        }
    }
}
