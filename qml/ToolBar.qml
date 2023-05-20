import QtQuick 2.15
import QtGraphicalEffects 1.15

Item {
    id: toolBar
    height: 71
    anchors.bottomMargin: -18
    state: "WithoutLabels"

    signal buttonClicked(string intent)

    Behavior on anchors.bottomMargin {
        NumberAnimation {
            duration: 200
            easing.type: Easing.OutCubic
        }
    }

    Rectangle {
        width: 1
        height: 4
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right

        gradient: Gradient {
            GradientStop { position: 0.0; color: "white" }
            GradientStop { position: 1.0; color: "black" }
        }
    }

    Rectangle {
        y: 3
        anchors.left: parent.left
        anchors.right: parent.right
        height: 68
        color: "#248b00"

        LinearGradient {
            width: 360
            height: 214
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.fill: parent
            opacity: 0.3
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#248b00" }
                GradientStop { position: 0.5; color: "white" }
                GradientStop { position: 1.0; color: "#248b00" }
            }
        }

        Image {
            id: openFolderIcon
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.right: showIPIcon.left
            anchors.rightMargin: 40
            source: "icons/OpenFolderIcon.png"

            MouseArea {
                anchors.fill: parent
                // onClicked: guiBehind.openDestinationFolder();
            }
        }
        Text {
            anchors.top: openFolderIcon.bottom
            anchors.topMargin: 3
            anchors.horizontalCenter: openFolderIcon.horizontalCenter
            text: qsTr("Received")
            color: "#ffffff"
            font.pixelSize: 12
            horizontalAlignment: Text.AlignHCenter
            width: 1
        }

        Image {
            id: showIPIcon
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
            source: "icons/ShowIPIcon.png"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    // guiBehind.refreshIpList();
                    toolBar.buttonClicked("ip");
                }
            }
        }
        Text {
            anchors.top: showIPIcon.bottom
            anchors.topMargin: 3
            anchors.horizontalCenter: showIPIcon.horizontalCenter
            text: qsTr("Addresses")
            color: "#ffffff"
            font.pixelSize: 12
            horizontalAlignment: Text.AlignHCenter
            width: 1
        }

        Image {
            id: settingsIcon
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: showIPIcon.right
            anchors.leftMargin: 40
            source: "icons/SettingsIcon.png"

            MouseArea {
                anchors.fill: parent
                onClicked: toolBar.buttonClicked("settings")
            }
        }
        Text {
            anchors.top: settingsIcon.bottom
            anchors.topMargin: 3
            anchors.horizontalCenter: settingsIcon.horizontalCenter
            text: qsTr("Settings")
            color: "#ffffff"
            font.pixelSize: 12
            horizontalAlignment: Text.AlignHCenter
            width: 1
        }
    }

    Image {
        id: moreIcon
        anchors.top: parent.top
        anchors.topMargin: 4
        anchors.right: parent.right
        anchors.rightMargin: 12
        source: "icons/MoreIcon.png"
    }

    MouseArea {
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: moreIcon.left
        anchors.right: parent.right

        onClicked: {
           if (toolBar.state == "WithoutLabels")
               toolBar.state = "WithLabels";
           else
               toolBar.state = "WithoutLabels";
       }
    }

    states: [
        State {
            name: "WithoutLabels"

            PropertyChanges {
                target: toolBar
                anchors.bottomMargin: -18
            }
        },
        State {
            name: "WithLabels"

            PropertyChanges {
                target: toolBar
                anchors.bottomMargin: 0
            }
        }
    ]
}
