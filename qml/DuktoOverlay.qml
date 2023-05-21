import QtQuick 2.15

Rectangle {
    color: "#00000000"
    state: /*guiBehind.showTermsOnStart ? "termspage" :*/ "none"

    Rectangle {
        id: disabler
        anchors.fill: parent
        color: "#ccffffff" // theme.color9
        opacity: 0
        visible: false

        MouseArea {
            anchors.fill: parent
        }
    }

    IPPage {
        id: ipPage
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.bottom: parent.bottom
        width: parent.width
        x: -50
        opacity: 0
        onBackHome: parent.state = "none"
    }

    states: [
        State {
            name: "ip"
            PropertyChanges {
                target: ipPage
                opacity: 1
                x: 0
            }
            PropertyChanges {
                target: disabler
                opacity: 1
                visible: true
            }
        }
    ]

    transitions: [
        Transition {
            NumberAnimation { properties: "x,y"; easing.type: Easing.OutCubic; duration: 500 }
            NumberAnimation { properties: "opacity"; easing.type: Easing.OutCubic; duration: 500 }
        }
    ]
}
