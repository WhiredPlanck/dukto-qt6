import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 360
    height: 500
    minimumWidth: 350
    maximumWidth: 350
    minimumHeight: 500
    maximumHeight: 5000
    visible: true
    title: qsTr("Dukto")

    DuktoFragment {
        id: duktoFragment
        anchors.fill: parent
    }
}
