import QtQuick 2.15

Rectangle {
    state: "buddies"
    color: ColorSingleton.white

    signal showIPList()
    signal showSettings()

    function goToPage(page) {
        tabBar.state = page
        state = page
    }

    TabBar {
        id: tabBar
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        onTabClicked: parent.state = tab
    }

    ToolBar {
        id: toolBar
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        onButtonClicked: {
            if (intent == "ip") showIPList()
            if (intent == "settings") showSettings()
        }
    }

    BuddiesPage {
        id: buddiesPage
        anchors.top: tabBar.bottom
        anchors.topMargin: 10
        anchors.bottom: toolBar.top
        width: parent.width
        x: 200
        opacity: 0
    }

    RecentPage {
        id: recentPage
        anchors.top: tabBar.bottom
        anchors.topMargin: 10
        anchors.bottom: toolBar.top
        width: parent.width
        x: parent.width
        opacity: 0
    }

    AboutPage {
        id: aboutPage
        anchors.top: tabBar.bottom
        anchors.topMargin: 10
        anchors.bottom: toolBar.top
        width: parent.width
        x: parent.width
        opacity: 0
    }

    states: [
        State {
            name: "buddies"

            PropertyChanges {
                target: buddiesPage
                opacity: 1
                x: 0
            }
        },
        State {
            name: "recent"

            PropertyChanges {
                target: buddiesPage
                opacity: 0
                x: -360
            }
            PropertyChanges {
                target: recentPage
                opacity: 1
                x: 0
            }
        },
        State {
            name: "about"

            PropertyChanges {
                target: buddiesPage
                opacity: 0
                x: -360
            }
            PropertyChanges {
                target: recentPage
                opacity: 0
                x: -360
            }
            PropertyChanges {
                target: aboutPage
                opacity: 1
                x: 0
            }
        }
    ]

    transitions: [
        Transition {
            NumberAnimation {
                properties: "x,y"
                easing.type: Easing.OutQuart
                duration: 1000
            }
            NumberAnimation {
                properties: "opacity"
                easing.type: Easing.InQuad
                duration: 500
            }
        }
    ]
}
