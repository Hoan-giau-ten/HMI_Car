import QtQuick

Rectangle {
    property string icon
    width: 56; height: 56; radius: 16
    color: "#191a1b"
    border.width: 1; border.color: "#252627"
    Text { anchors.centerIn: parent; text: icon; font.family: mainWindow.globalIconFont; color: "#ffffff"; font.pixelSize: 24 }
    MouseArea {
        anchors.fill: parent
        onPressed: parent.color = "#252627"
        onReleased: parent.color = "#191a1b"
    }
}
