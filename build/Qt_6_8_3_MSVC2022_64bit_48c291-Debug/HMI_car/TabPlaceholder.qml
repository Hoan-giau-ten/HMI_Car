import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    anchors.fill: parent
    color: "#222"
    property string title: "Page"

    Text {
        anchors.centerIn: parent
        text: title
        color: "white"
        font.pixelSize: 28
    }
}
