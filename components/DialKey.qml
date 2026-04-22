import QtQuick

Rectangle {
    property string number
    property string letters
    width: 80; height: 80; radius: 40
    color: "#121315"
    border.width: 1; border.color: "#252627"

    Column {
        anchors.centerIn: parent; spacing: -2
        Text { text: number; color: "#ffffff"; font.pixelSize: 28; font.family: "Manrope"; anchors.horizontalCenter: parent.horizontalCenter }
        Text { text: letters; color: "#ababac"; font.pixelSize: 9; font.weight: Font.Bold; font.letterSpacing: 1; anchors.horizontalCenter: parent.horizontalCenter }
    }

    MouseArea {
        anchors.fill: parent
        onPressed: parent.color = "#252627"
        onReleased: parent.color = "#121315"
    }
}
