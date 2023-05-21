#ifndef IPADDRESSITEMMODEL_H
#define IPADDRESSITEMMODEL_H

#include <QStandardItemModel>

class IPAddressItemModel : public QStandardItemModel
{
    Q_OBJECT
public:
    explicit IPAddressItemModel();
    void refreshIPList();

    enum class IPRoles {
        IP = Qt::UserRole + 1
    };

private:
    void addIP(QString ip);
};

#endif // IPADDRESSITEMMODEL_H
