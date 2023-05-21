import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    minimumWidth: 350
    maximumWidth: 350
    minimumHeight: 500
    maximumHeight: 5000
    visible: true
    title: qsTr("Dukto")

    Rectangle {
        id: mainElement
        width: 360
        height: 500
        anchors.fill: parent

        DuktoFragment {
            id: duktoFragment
            anchors.fill: parent
            onShowIPList: {
                duktoOverlay.state = "ip"
            }
        }

        DuktoOverlay {
            id: duktoOverlay
            // here we must judge the state since Qt 5
            // because the disabler of duktoOverlay fills its
            // parent, and it will block our mouse events
            // for pages below it even the overlay doesn't
            // show any page yet
            // anchors.fill: state == "none" ? undefined : mainElement // bad code
            onStateChanged: {
                if (state == "none") {
                    anchors.fill = undefined
                    // we must reanchor again to fresh the layout
                    // because "when the left anchor is unset,
                    // the new width will remain. Thus when
                    // updating anchors within JavaScript,
                    // you should first unset any anchors that
                    // are no longer required, and only then
                    // set any new anchors that are required.
                    // see https://doc.qt.io/qt-6/qtquick-positioning-anchors.html#changing-anchors
                    width = 0
                } else {
                    anchors.fill = parent
                }
            }
        }

        Binding {
            target: engineRunner
            property: "overlayState"
            value: duktoOverlay.state
        }
    }
}
