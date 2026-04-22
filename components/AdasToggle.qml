import QtQuick
import QtQuick.Layouts

Rectangle {
    property string icon
    property string title
    property string subtitle
    property color iconColor: "#81ecff"
    property bool isOn: false

    Layout.fillWidth: true
    height: 88
    radius: 20
    color: "#191a1b"
    border.width: 1
    border.color: "#252627"

    RowLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 16

        Text {
            text: icon
            font.family: mainWindow.globalIconFont
            color: iconColor
            font.pixelSize: 32
        }

        Column {
            Layout.fillWidth: true
            spacing: 4

            Text {
                text: title
                color: "#ffffff"
                font.pixelSize: 16
                font.weight: Font.Bold
                font.family: "Manrope"
            }
            Text {
                text: subtitle
                color: "#ababac"
                font.pixelSize: 12
            }
        }

        Rectangle {
            width: 60
            height: 32
            radius: 16
            color: isOn ? "#81ecff" : "#252627"
            border.width: 2; border.color: isOn ? "#00e3fd" : "#454749"

            Behavior on color { ColorAnimation { duration: 250 } }

            Rectangle {
                width: 24
                height: 24
                radius: 12
                color: isOn ? "#003840" : "#ababac"
                anchors.verticalCenter: parent.verticalCenter
                x: isOn ? parent.width - width - 4 : 4

                Behavior on x { NumberAnimation { duration: 250; easing.type: Easing.OutQuart } }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: isOn = !isOn
            }
        }
    }
}






