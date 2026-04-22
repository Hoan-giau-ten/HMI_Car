import QtQuick

Rectangle {
    property string title
    property string psi

    width: 120
    height: 60
    radius: 14
    color: Qt.rgba(15/255, 18/255, 20/255, 0.85)
    border.width: 1
    border.color: Qt.rgba(0, 227/255, 253/255, 0.2)

    Column {
        anchors.centerIn: parent
        spacing: 2

        Text {
            text: title
            color: "#8a8b8d"
            font.pixelSize: 10
            font.weight: Font.Bold
            font.letterSpacing: 1
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 4

            Text {
                id: numText
                text: psi
                color: "#ffffff"
                font.pixelSize: 24; font.weight: Font.Black; font.family: "Manrope"
            }

            Text {
                text: "PSI"
                color: "#00e3fd"
                font.pixelSize: 11
                font.weight: Font.Bold
                anchors.baseline: numText.baseline
            }
        }
    }
}












