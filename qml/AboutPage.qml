import QtQuick 2.15
import QtGraphicalEffects 1.15

Item {

    Rectangle {
        x: 27
        y: 15
        width: 64
        height: 64
        color: themeManager.colorPrimary

        TileGradient {
            anchors.fill: parent
        }

         Image {
             source: "icons/DuktoMetroIcon.png"
             anchors.fill: parent
         }
    }

    SmoothText {
        y: 80
        x: 22
        font.pixelSize: 100
        text: "Dukto R6"
        color: ColorSingleton.darkGray
    }
    SmoothText {
        x: 25
        y: 70 + 75
        font.pixelSize: 38
        text: qsTr("Created by Emanuele Colombo")
        color: ColorSingleton.darkGray
    }
    SmoothText {
        x: 25
        y: 100 + 75
        font.pixelSize: 32
        text: qsTr("Website: <a href=\"http://www.msec.it/dukto/\">http://www.msec.it/dukto/</a>")
        onLinkActivated: Qt.openUrlExternally(link)
        color: ColorSingleton.darkGray
    }

    Text {
        anchors.right: parent.right
        anchors.rightMargin: 40
        anchors.left: parent.left
        anchors.leftMargin: 25
        y: 240
        font.pixelSize: 12
        color: ColorSingleton.darkGray
        wrapMode: Text.WordWrap
        text: qsTr("This application and it's source code are released freely as open source project.<br>If you like this application please consider <a href=\"http://www.msec.it/\">making a donation</a>.")
        onLinkActivated: Qt.openUrlExternally(link)
    }
}
