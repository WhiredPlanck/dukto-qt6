#include <QUrl>
#include <QRegExp>
#include <QHostInfo>
#include <QSysInfo>
#include <QDir>

#include "buddylistitemmodel.h"
#include "os.h"
#include "peer.h"
#include "utilities.h"

BuddyListItemModel::BuddyListItemModel() :
    QStandardItemModel(nullptr)
{
    QHash<int, QByteArray> roleNames;
    roleNames[dukto::toUType(BuddyRoles::IP)] = "ip";
    roleNames[dukto::toUType(BuddyRoles::Port)] = "port";
    roleNames[dukto::toUType(BuddyRoles::Username)] = "username";
    roleNames[dukto::toUType(BuddyRoles::System)] = "system";
    roleNames[dukto::toUType(BuddyRoles::Platform)] = "platform";
    roleNames[dukto::toUType(BuddyRoles::GenericAvatar)] = "generic";
    roleNames[dukto::toUType(BuddyRoles::Avatar)] = "avatar";
    roleNames[dukto::toUType(BuddyRoles::OSLogo)] = "oslogo";
    roleNames[dukto::toUType(BuddyRoles::ShowBack)] = "showback";
    setItemRoleNames(roleNames);
}

void BuddyListItemModel::addMeElement()
{
    addBuddy("",
             0,
             dukto::os::userName() + tr(" (You)"),
             dukto::os::hostName(),
             dukto::os::osName(),
             QUrl::fromLocalFile("")); // TODO: get avatar here
}

void BuddyListItemModel::addIPElement()
{
    addBuddy(tr("IP"),
             0,
             tr("IP connection"),
             tr("Send data to a remote device"),
             tr("IP"),
             QUrl(""));
}

void BuddyListItemModel::addBuddy(QString ip, qint16 port, QString username, QString system, QString platform, QUrl avatarPath)
{
    QStandardItem* it = nullptr;
    bool add = true;

    // Check if the same IP is alreay in the buddy list
    if (itemMap_.contains(ip)) {
        it = itemMap_[ip];
        add = false;
    }
    else
        it = new QStandardItem();
    it->setData(ip, dukto::toUType(BuddyRoles::IP));
    it->setData(port, dukto::toUType(BuddyRoles::Port));
    it->setData(false, dukto::toUType(BuddyRoles::ShowBack));

    // Set (or update) data
    it->setData(username, dukto::toUType(BuddyRoles::Username));
    if (ip != "IP")
        it->setData("at " + system, dukto::toUType(BuddyRoles::System));
    else
        it->setData(system, dukto::toUType(BuddyRoles::System));
    it->setData(platform, dukto::toUType(BuddyRoles::Platform));
    it->setData(avatarPath, dukto::toUType(BuddyRoles::Avatar));

    // Update generic avatar
    if ((platform.toLower() == "android") || (platform.toLower() == "ios"))
        it->setData("icons/SmartPhoneLogo.png", dukto::toUType(BuddyRoles::GenericAvatar));
    else if (platform.toLower() == "ip")
        it->setData("icons/IPLogo.png", dukto::toUType(BuddyRoles::GenericAvatar));
    else
        it->setData("icons/PCLogo.png", dukto::toUType(BuddyRoles::GenericAvatar));

    // Update logo
    if (platform.toLower() == "windows")
        it->setData("icons/WindowsLogo.png", dukto::toUType(BuddyRoles::OSLogo));
    else if (platform.toLower() == "macos")
        it->setData("icons/AppleLogo.png", dukto::toUType(BuddyRoles::OSLogo));
    else if (platform.toLower() == "linux")
        it->setData("icons/LinuxLogo.png", dukto::toUType(BuddyRoles::OSLogo));
    else if (platform.toLower() == "ios")
        it->setData("icons/iOSLogo.png", dukto::toUType(BuddyRoles::OSLogo));
    else if (platform.toLower() == "android")
        it->setData("icons/AndroidLogo.png", dukto::toUType(BuddyRoles::OSLogo));
    else
        it->setData("icons/UnknownLogo.png", dukto::toUType(BuddyRoles::OSLogo));

    // Add elemento to the list
    if (add) {
        appendRow(it);
        if (ip != "")
            itemMap_.insert(ip, it);
        else
            item_ = it;
    }
}

void BuddyListItemModel::addBuddy(Peer &peer)
{
    QRegExp rx("^(.*)\\sat\\s(.*)\\s\\((.*)\\)$");
    rx.indexIn(peer.name);
    QStringList data = rx.capturedTexts();

    QString username = data[1];
    QString system = data[2];
    QString platform = data[3];
    QUrl avatarPath = QUrl("http://" + peer.address.toString() + ":" + QString::number(peer.port + 1) + "/dukto/avatar");

    addBuddy(peer.address.toString(),
             peer.port,
             username,
             system,
             platform,
             avatarPath);
}

void BuddyListItemModel::removeBuddy(QString ip)
{
    // Check for element
    if (!itemMap_.contains(ip)) return;

    // Get element
    QStandardItem* it = itemMap_[ip];

    // Remove element
    itemMap_.remove(ip);
    this->removeRow(this->indexFromItem(it).row());
}

void BuddyListItemModel::showSingleBack(int idx)
{
    for (int i = 0; i < rowCount(); i++)
        itemFromIndex(index(i, 0))->setData(false, dukto::toUType(BuddyRoles::ShowBack));
    itemFromIndex(index(idx, 0))->setData(true, dukto::toUType(BuddyRoles::ShowBack));
}

QString BuddyListItemModel::buddyNameByIp(QString ip)
{
    if (!itemMap_.contains(ip)) return "";
    return itemMap_.value(ip)->data(dukto::toUType(BuddyRoles::Username)).toString();
}

QStandardItem* BuddyListItemModel::buddyByIp(QString ip)
{
    if (!itemMap_.contains(ip)) return NULL;
    return itemMap_.value(ip);
}

QString BuddyListItemModel::fistBuddyIp()
{
    if (this->rowCount() < 3) return "";
    return this->index(2, 0).data(dukto::toUType(BuddyRoles::IP)).toString();
}

void BuddyListItemModel::updateMeElement()
{
    item_->setData(QDir::home().dirName(), dukto::toUType(BuddyRoles::Username));
}
