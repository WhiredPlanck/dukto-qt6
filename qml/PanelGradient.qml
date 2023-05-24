import QtQuick 2.15
import QtGraphicalEffects 1.15

LinearGradient {
    width: 360
    height: 214
    opacity: 0.3
    gradient: Gradient {
        GradientStop { position: 0.0; color: "transparent" }
        GradientStop { position: 0.5; color: "white" }
        GradientStop { position: 1.0; color: "transparent" }
    }
}
