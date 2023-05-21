import QtQuick 2.15

Rectangle {
    id: ipPage
    color: "#00000000"

    signal backHome()

    MouseArea {
        anchors.fill: parent
    }

    Item {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.right: parent.right
        height: 200

        Rectangle {
            id: backRecangle
            color: "#248b00" // theme.color2
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            width: 600
        }

        Image {
            id: backIcon
            source: "icons/BackIcon.png"
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 5
            anchors.leftMargin: 5

            MouseArea {
                anchors.fill: parent
                onClicked: ipPage.backHome();
            }
        }

        SmoothText {
            id: boxTitle
            anchors.left: backIcon.right
            anchors.top: parent.top
            anchors.leftMargin: 15
            anchors.topMargin: 5
            font.pixelSize: 64
            text: qsTr("Your IP addresses")
        }

        ListView {
            anchors.top: backIcon.bottom
            anchors.left: boxTitle.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.topMargin: 20
            anchors.bottomMargin: 10
            clip: true

            model: ipAddressItemModel /*ListModel {
                ListElement { ip: "192.168.92.32" }
                ListElement { ip: "182.23.2.1" }
                ListElement { ip: "169.0.3.2" }
            } */

            delegate: Component {
                Text {
                    text: model.ip
                    color: "#ffffff"
                    font.pixelSize: 17
                }
            }
        }
    }
}
