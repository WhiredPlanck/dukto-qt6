import QtQuick 2.15

Rectangle {
    id: button
    width: 150
    height: 30
    border.color: buttonEnabled ? themeManager.colorPrimary : ColorSingleton.lightGray
    border.width: 2
    color: buttonArea.containsMouse ? (buttonArea.pressed ? ColorSingleton.lightGray : ColorSingleton.offWhite)
                                    : ColorSingleton.white

    property bool buttonEnabled: true
    property alias label: textLabel.text
    signal clicked()

    Text {
        id: textLabel
        anchors.fill: parent
        color: buttonEnabled ? themeManager.colorPrimary : ColorSingleton.lightGray
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 12
    }

    MouseArea {
        id: buttonArea
        anchors.fill: parent
        hoverEnabled: true
        enabled: button.buttonEnabled
        onClicked: button.clicked();
    }
}
