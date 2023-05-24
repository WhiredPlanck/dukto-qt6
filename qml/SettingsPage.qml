import QtQuick 2.15
import QtGraphicalEffects 1.15

Rectangle {
    id: settingsPage
    color: ColorSingleton.white

    signal backHome()

    function refreshColor() {
        picker.setColor(themeManager.colorPrimary);
    }

    MouseArea {
        anchors.fill: parent
    }

    Image {
        id: backIcon
        source: "icons/BackIconDark.png"
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 5
        anchors.leftMargin: 5

        MouseArea {
            anchors.fill: parent
            onClicked: settingsPage.backHome();
        }
    }

    SmoothText {
        id: boxTitle
        anchors.left: backIcon.right
        anchors.top: parent.top
        anchors.leftMargin: 15
        anchors.topMargin: 5
        font.pixelSize: 64
        text: qsTr("Settings")
        color: themeManager.colorAccent
    }

    Text {
        id: labelPath
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 17
        anchors.topMargin: 70
        font.pixelSize: 16
        text: qsTr("Save received file in:")
        color: ColorSingleton.gray
    }

    Rectangle {
        id: textPath
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: labelPath.bottom
        anchors.leftMargin: 17
        anchors.rightMargin: 17
        anchors.topMargin: 8
        height: 30
        color: themeManager.colorPrimary
        clip: true

        PanelGradient {
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.fill: parent
        }

        Text {
            anchors.leftMargin: 5
            anchors.rightMargin: 5
            anchors.fill: parent
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideMiddle
            font.pixelSize: 12
            color: "white"
            text: appSettings.currentRecevieDirectory
        }
    }

    ButtonDark {
        id: buttonPath
        anchors.right: parent.right
        anchors.rightMargin: 17
        anchors.top: textPath.bottom
        anchors.topMargin: 10
        label: qsTr("Change folder")
        onClicked: engineRunner.changeRecevieDirectory()
    }

    Text {
        id: labelColor
        anchors.left: labelPath.left
        anchors.top: buttonPath.bottom
        anchors.topMargin: 40
        font.pixelSize: 16
        text: qsTr("Theme color:")
        color: ColorSingleton.gray
    }

    ColorPicker {
        id: picker
        anchors.top: labelColor.bottom
        anchors.topMargin: 8
        anchors.left: labelColor.left
        onChanged: {
            themeManager.setThemeColor(colorValue)
            appSettings.themeColorPrimary = colorValue
        }
    }

    ColorBox {
        id: cbox1
        anchors.top: labelColor.bottom
        anchors.topMargin: 8
        anchors.left: picker.right
        anchors.leftMargin: 20
        color: "#248B00"
        onClicked: picker.setColor(color)
    }

    ColorBox {
        id: cbox2
        anchors.top: cbox1.top
        anchors.left: cbox1.right
        anchors.leftMargin: 15
        color: "#A80000"
        onClicked: picker.setColor(color)
    }

    ColorBox {
        id: cbox3
        anchors.top: cbox1.top
        anchors.left: cbox2.right
        anchors.leftMargin: 15
        color: "#3A6CBC"
        onClicked: picker.setColor(color)
    }

    ColorBox {
        id: cbox4
        anchors.top: cbox1.bottom
        anchors.topMargin: 15
        anchors.left: cbox1.left
        color: "#2e3436" // "#704214"
        onClicked: picker.setColor(color)
    }

    ColorBox {
        id: cbox5
        anchors.left: cbox4.right
        anchors.top: cbox4.top
        anchors.leftMargin: 15
        color: "#B77994"
        onClicked: picker.setColor(color)
    }

    ColorBox {
        id: cbox6
        anchors.top: cbox4.top
        anchors.left: cbox5.right
        anchors.leftMargin: 15
        color: "#5B2F42"
        onClicked: picker.setColor(color)
    }

    ColorBox {
        id: cbox7
        anchors.top: cbox4.bottom
        anchors.topMargin: 15
        anchors.left: cbox4.left
        color: "#353B56"
        onClicked: picker.setColor(color)
    }

    ColorBox {
        id: cbox8
        anchors.top: cbox7.top
        anchors.left: cbox7.right
        anchors.leftMargin: 15
        color: "#FB8504"
        onClicked: picker.setColor(color)
    }

    ColorBox {
        id: cbox9
        anchors.top: cbox7.top
        anchors.left: cbox8.right
        anchors.leftMargin: 15
        color: "#6D0D71"
        onClicked: picker.setColor(color)
    }
}
