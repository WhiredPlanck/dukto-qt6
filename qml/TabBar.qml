import QtQuick 2.15

Item {
    id: tabBar
    height: 65
    state: "buddies"

    signal tabClicked(string tab)

    Item {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right

        SmoothText {
            id: buddyText
            x: 10
            font.pixelSize: 84
            text: qsTr("buddies")
            transformOrigin: Item.TopLeft
            color: buddyTextMouseArea.containsMouse ? "#4cb328" : "#cccccc"
            scale: 0.5

            MouseArea {
                id: buddyTextMouseArea
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    tabBar.state = "buddies"
                    tabBar.tabClicked("buddies")
                }
            }
        }

        SmoothText {
            id: recentText
            x: 182
            font.pixelSize: 84
            text: qsTr("recent")
            transformOrigin: Item.TopLeft
            color: recentTextMouseArea.containsMouse ? "#4cb328" : "#cccccc"
            scale: 0.5

            MouseArea {
                id: recentTextMouseArea
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    tabBar.state = "recent"
                    tabBar.tabClicked("recent")
                }
            }
        }

        SmoothText {
            id: aboutText
            x: 320
            font.pixelSize: 84
            color: aboutTextMouseArea.containsMouse ? "#4cb328" : "#cccccc"
            text: qsTr("about")

            MouseArea {
                id: aboutTextMouseArea
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    tabBar.state = "about"
                    tabBar.tabClicked("about")
                }
            }
         }
    }

    states: [
        State {
            name: "buddies"

            PropertyChanges {
                target: buddyText
                color: "#000000"
            }
        },
        State {
            name: "recent"

            PropertyChanges {
                target: buddyText
                x: -55
            }

            PropertyChanges {
                target: recentText
                x: 117
                color: "#000000"
            }

            PropertyChanges {
                target: aboutText
                x: 255
            }
        },
        State {
            name: "about"

            PropertyChanges {
                target: buddyText
                x: -120
            }

            PropertyChanges {
                target: recentText
                x: 52
            }

            PropertyChanges {
                target: aboutText
                x: 190
                color: "#000000"
            }
        }
    ]

    transitions: [
        Transition {
            NumberAnimation {
                properties: "x,y"
                easing.type: Easing.OutInQuart
                duration: 1000
            }

            ColorAnimation {
                duration: 300
            }
        }
    ]
}
