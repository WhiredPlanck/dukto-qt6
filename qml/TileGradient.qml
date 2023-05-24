import QtQuick 2.15
import QtGraphicalEffects 1.15

LinearGradient {
    width: 64
    height: 64
    start: Qt.point(0, height)
    end: Qt.point(width, 0)
    opacity: 0.3
    gradient: Gradient {
        GradientStop { position: 0.0; color: "transparent" }
        GradientStop { position: 0.618; color: "white" }
        GradientStop { position: 1.0; color: "transparent" }
    }
}
