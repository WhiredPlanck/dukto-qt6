import QtQuick 2.15

Rectangle {
    id: button
    width: 150
    height: 30
//    border.color: buttonEnabled ? theme.color2 : theme.color7
    border.color: buttonEnabled ? "#248b00" : "#cccccc"
    border.width: 2
//    color: buttonArea.containsMouse ? (buttonArea.pressed ? theme.color7 : theme.color8) : theme.color6
    color: buttonArea.containsMouse ? (buttonArea.pressed ? "#cccccc" : "#eeeeee") : "#ffffff"

    property bool buttonEnabled: true
    property alias label: textLabel.text
    signal clicked()

    Text {
        id: textLabel
        anchors.fill: parent
//        color: buttonEnabled ? theme.color2 : theme.color7
        color: buttonEnabled ? "#248b00" : "#cccccc"
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
