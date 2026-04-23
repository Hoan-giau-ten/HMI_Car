import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import HMI_Car

Rectangle {
    property string iconCode
    property string labelText
    property bool isActive: activeTab === labelText

    Layout.fillWidth: true
    height: 90
    color: isActive ? Qt.rgba(Style.themeColor.r, Style.themeColor.g, Style.themeColor.b, 0.05) : "transparent"
    border.width: isActive ? 4 : 0
    border.color: isActive ? Style.themeColor : "transparent"

    Rectangle {
        width: 4; height: parent.height
        anchors.right: parent.right
        color: Style.themeColor
        visible: parent.isActive
    }

    Column {
        anchors.centerIn: parent
        spacing: 4
        Text {
            text: iconCode
            font.family: materialFont.name // <--- GÁN FONT Ở ĐÂY
            font.pixelSize: 32
            color: isActive ? Style.themeMuted : "#ababac"
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Text {
            text: labelText
            font.pixelSize: 10
            font.weight: isActive ? Font.Bold : Font.Medium
            color: isActive ? Style.themeMuted : "#ababac"
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: activeTab = labelText
    }

    Behavior on color { ColorAnimation { duration: 200 } }
    Behavior on border.color { ColorAnimation { duration: 200 } }
}
