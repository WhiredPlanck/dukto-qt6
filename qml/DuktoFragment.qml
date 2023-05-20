import QtQuick 2.15

Rectangle {
    state: "buddies"
    color: "#ffffff"

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
}
