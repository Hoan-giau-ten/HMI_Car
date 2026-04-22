import QtQuick

Rectangle {
    property string labelText
    width: 140; height: 50; radius: 25
    color: "#252627"
    visible: true
    Text { anchors.centerIn: parent; text: labelText; color: "#ffffff"; font.pixelSize: 14; font.weight: Font.Bold }
    MouseArea {
        anchors.fill: parent
        onPressed: parent.color = "#454749"
        onReleased: parent.color = "#252627"
    }
}
