import QtQuick
import QtQuick.Layouts

Rectangle {
    property string modeName
    property int modeIndex
    property bool isActive: Backend.driveMode === modeIndex

    Layout.fillWidth: true
    Layout.fillHeight: true
    radius: 12
    color: isActive ? Style.themeColor : "transparent"

    Text {
        anchors.centerIn: parent
        text: modeName
        color: isActive ? "#000000" : "#ababac"
        font.weight: isActive ? Font.Black : Font.Bold
        font.letterSpacing: 1
    }

    MouseArea {
        anchors.fill:  parent
        onClicked: Backend.setDriveMode(modeIndex)
    }
}
