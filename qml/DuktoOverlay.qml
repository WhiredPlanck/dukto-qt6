import QtQuick 2.15

Rectangle {
    color: "#00000000"
    state: appSettings.showTermsOnStart ? "termspage" : "none"

    Rectangle {
        id: disabler
        anchors.fill: parent
        color: ColorSingleton.semiTransWhite
        opacity: 0
        visible: false

        MouseArea {
            anchors.fill: parent
        }
    }

    // remember that we set the width of this overlay
    // to 0 after the state change to "none", so we must
    // set the horizontal ordinates (x) of these pages to
    // a fix negative (i.e. the negative of the width of
    // Dukto window). Otherwise these pages will still
    // mask the main pages and block the mouse events.

    IPPage {
        id: ipPage
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.bottom: parent.bottom
        width: parent.width
        x: -360
        opacity: 0
        onBackHome: parent.state = "none"
    }

    SettingsPage {
        id: settingsPage
        width: parent.width
        height: parent.height
        x: -360
        opacity: 1
        onBackHome: parent.state = "none"
    }

    TermsPage {
        id: termsPage
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: parent.width
        x: -360
        opacity: 0
        onAccepted: {
            appSettings.showTermsOnStart = false;
            parent.state = "none"
        }
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
        },
        State {
            name: "settings"

            PropertyChanges {
                target: settingsPage
                opacity: 1
                x: 0
            }
        },
        State {
            name: "termspage"
            PropertyChanges {
                target: termsPage
                opacity: 1
                x: 0
            }
        }
    ]

    transitions: [
        Transition {
            NumberAnimation { properties: "x,y"; easing.type: Easing.OutCubic; duration: 880 }
            NumberAnimation { properties: "opacity"; easing.type: Easing.OutCubic; duration: 500 }
        }
    ]
}
