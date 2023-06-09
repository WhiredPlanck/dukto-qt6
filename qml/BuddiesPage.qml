import QtQuick 2.15

Item {
    clip: true

    ListView {
        id: buddyList
        anchors.fill: parent
        spacing: 10
        anchors.leftMargin: 25
        anchors.rightMargin: 0
        model: buddyListItemModel

        delegate: Component {
             BuddyListElement {
                 buddyIP: model.ip
                 buddyAvatar: model.avatar
                 buddyGeneric: model.generic
                 buddyUsername: model.username
                 buddySystem: model.system
                 buddyOSLogo: model.oslogo
                 buddyShowBack: model.showback
             }
         }
    }
}
