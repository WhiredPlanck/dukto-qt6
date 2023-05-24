import QtQuick 2.15
import QtGraphicalEffects 1.15

Rectangle {
    id: root
    width: 32
    height: 32
    border.color: boxArea.containsMouse ? "#555555" : "#f0f0f0"
    border.width: boxArea.containsMouse ? 2 : 2
    clip: true

    signal clicked(color color)

    TileGradient {
        anchors.fill: parent
    }

    MouseArea {
        id: boxArea
        hoverEnabled: true
        anchors.fill: parent
        onClicked: root.clicked(parent.color)
    }
}
