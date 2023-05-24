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

    LinearGradient {
        anchors.fill: parent;
        start: Qt.point(0, height)
        end: Qt.point(width, 0)
        opacity: 0.3
        gradient: Gradient {
            GradientStop { position: 0.0; color: "transparent" }
            GradientStop { position: 0.618; color: "white" }
            GradientStop { position: 1.0; color: "transparent" }
        }
    }

//    Image {
//        anchors.fill: parent
//        source: "TileGradient.png"
//    }

    MouseArea {
        id: boxArea
        hoverEnabled: true
        anchors.fill: parent
        onClicked: root.clicked(parent.color)
    }
}
