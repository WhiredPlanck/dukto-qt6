#include <QDateTime>
#include <QLocale>
#include "recentlistitemmodel.h"
#include "utils/utilities.h"

RecentListItemModel::RecentListItemModel() :
    QStandardItemModel(nullptr)
{
    QHash<int, QByteArray> roleNames;
    roleNames[dukto::toUType(RecentRoles::Name)] = "name";
    roleNames[dukto::toUType(RecentRoles::Value)] = "value";
    roleNames[dukto::toUType(RecentRoles::Type)] = "type";
    roleNames[dukto::toUType(RecentRoles::TypeIcon)] = "typeIcon";
    roleNames[dukto::toUType(RecentRoles::DateTime)] = "dateTime";
    roleNames[dukto::toUType(RecentRoles::Sender)] = "sender";
    roleNames[dukto::toUType(RecentRoles::Size)] = "size";
    setItemRoleNames(roleNames);
}

void RecentListItemModel::addRecent(QString name, QString value, QString type, QString sender, qint64 size)
{
    QStandardItem* it = new QStandardItem();

    // Format timestamp
    QDateTime now = QDateTime::currentDateTime();
    QString datetime = QLocale::system().toString(now, QLocale::ShortFormat);

    // Convert size data
    QString sizeFormatted;
    if (size < 1024)
        sizeFormatted = QString::number(size) + " B";
    else if (size < 1048576)
        sizeFormatted = QString::number(size * 1.0 / 1024, 'f', 1) + " KB";
    else
        sizeFormatted = QString::number(size * 1.0 / 1048576, 'f', 1) + " MB";

    // Icon
    if (type == "text")
        it->setData("RecentText.png", dukto::toUType(RecentRoles::TypeIcon));
    else if (type == "file")
        it->setData("RecentFile.png", dukto::toUType(RecentRoles::TypeIcon));
    else
        it->setData("RecentFiles.png", dukto::toUType(RecentRoles::TypeIcon));

    if (type == "text")
        it->setData(name, dukto::toUType(RecentRoles::Name));
    else
        it->setData(name + " (" + sizeFormatted + ")", dukto::toUType(RecentRoles::Name));
    it->setData(value, dukto::toUType(RecentRoles::Value));
    it->setData(type, dukto::toUType(RecentRoles::Type));
    it->setData(datetime, dukto::toUType(RecentRoles::DateTime));
    it->setData(sender, dukto::toUType(RecentRoles::Sender));
    it->setData(sizeFormatted, dukto::toUType(RecentRoles::Size));
    insertRow(0, it);
}
