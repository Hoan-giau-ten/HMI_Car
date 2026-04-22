import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import "components"

Item {
    id: root
    anchors.fill: parent

    // Biến lưu trạng thái mục cài đặt đang được chọn
    property int selectedSettingIndex: 0

    RowLayout {
        anchors.fill: parent
        spacing: 48

        // ==========================================
        // CỘT TRÁI: DANH SÁCH CÀI ĐẶT
        // ==========================================
        ColumnLayout {
            Layout.fillHeight: true
            Layout.preferredWidth: root.width * 0.55
            spacing: 24

            // Header: Tiêu đề & Thanh tìm kiếm
            RowLayout {
                Layout.fillWidth: true

                Text {
                    text: "System Settings"
                    color: "#ffffff"
                    font.pixelSize: 36
                    font.family: "Manrope"
                    font.weight: Font.ExtraBold
                }

                Item { Layout.fillWidth: true }

                // Thanh tìm kiếm (Search Bar)
                Rectangle {
                    width: 240; height: 48; radius: 24
                    color: "#121315"
                    border.width: 1; border.color: "#252627"

                    RowLayout {
                        anchors.fill: parent; anchors.margins: 16; spacing: 8
                        Text { text: "search"; font.family: mainWindow.globalIconFont; color: "#ababac"; font.pixelSize: 20 }
                        Text { text: "Find setting..."; color: "#ababac"; font.pixelSize: 14; Layout.fillWidth: true }
                    }
                }
            }

            // Danh sách các mục cài đặt
            ListView {
                Layout.fillWidth: true
                Layout.fillHeight: true
                clip: true
                spacing: 16
                interactive: true // Cho phép cuộn mượt

                model: [
                    { icon: "light_mode", title: "Display", sub: "Brightness, Theme, HUD settings" },
                    { icon: "equalizer", title: "Sound & Audio", sub: "Spatial Audio, EQ, System alerts" },
                    { icon: "wifi", title: "Connectivity", sub: "5G LTE, Wi-Fi Hotspot, Bluetooth" },
                    { icon: "person", title: "User Profiles", sub: "Driver settings, Biometrics, Key tags" },
                    { icon: "security", title: "Privacy & Security", sub: "Sentry mode, Pin-to-drive, Data use" },
                    { icon: "update", title: "Software Update", sub: "Version 2.4.1 available" }
                ]

                delegate: Rectangle {
                    width: parent.width; height: 96; radius: 20
                    color: selectedSettingIndex === index ? "#191a1b" : "transparent"
                    border.width: selectedSettingIndex === index ? 1 : 0
                    border.color: selectedSettingIndex === index ? "#252627" : "transparent"

                    Behavior on color { ColorAnimation { duration: 250 } }

                    RowLayout {
                        anchors.fill: parent; anchors.margins: 24; spacing: 24

                        Rectangle {
                            width: 48; height: 48; radius: 16
                            color: selectedSettingIndex === index ? Qt.rgba(129/255, 236/255, 255/255, 0.1) : "#121315"
                            Text {
                                anchors.centerIn: parent
                                text: modelData.icon; font.family: mainWindow.globalIconFont
                                color: selectedSettingIndex === index ? "#81ecff" : "#ababac"
                                font.pixelSize: 24
                            }
                        }

                        Column {
                            Layout.fillWidth: true; spacing: 4
                            Text { text: modelData.title; color: "#ffffff"; font.pixelSize: 18; font.weight: Font.Bold; font.family: "Inter" }
                            Text { text: modelData.sub; color: "#ababac"; font.pixelSize: 13 }
                        }

                        Text {
                            text: "chevron_right"; font.family: mainWindow.globalIconFont
                            color: selectedSettingIndex === index ? "#ffffff" : "#454749"
                            font.pixelSize: 28
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: selectedSettingIndex = index
                    }
                }
            }
        }

        // ==========================================
        // CỘT PHẢI: TRỢ LÝ ẢO (VOICE ASSISTANT)
        // ==========================================
        Item {
            Layout.fillHeight: true
            Layout.preferredWidth: root.width * 0.45

            Rectangle {
                anchors.centerIn: parent
                width: parent.width * 0.9; height: 600; radius: 32

                gradient: Gradient {
                    GradientStop { position: 0.0; color: Qt.rgba(0, 227, 253, 0.08) }
                    GradientStop { position: 0.5; color: "#191a1b" }
                    GradientStop { position: 1.0; color: "#121315" }
                }
                border.width: 1; border.color: "#252627"

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 40
                    spacing: 24

                    Item { Layout.fillHeight: true }
                    Item {
                        Layout.alignment: Qt.AlignHCenter
                        width: 160
                        height: 160

                        Rectangle {
                            anchors.centerIn: parent
                            width: parent.width
                            height: parent.height
                            radius: width / 2
                            color: "transparent"
                            border.width: 1
                            border.color: Qt.rgba(129/255, 236/255, 255/255, 0.25)
                        }

                        Rectangle {
                            anchors.centerIn: parent
                            width: 110
                            height: 110
                            radius: width / 2
                            color: "#81ecff"
                            opacity: 0.08
                        }

                        Row {
                            anchors.centerIn: parent
                            spacing: 6

                            Repeater {
                                model: 7

                                Rectangle {
                                    width: 6
                                    radius: 3
                                    color: "#00e3fd"

                                    property int i: index
                                    property var heights: [18, 35, 55, 80, 55, 35, 18]

                                    height: heights[i]

                                    opacity: 0.9

                                    SequentialAnimation on height {
                                        loops: Animation.Infinite
                                        NumberAnimation {
                                            to: heights[i] + 10
                                            duration: 900
                                            easing.type: Easing.InOutSine
                                        }
                                        NumberAnimation {
                                            to: heights[i]
                                            duration: 900
                                            easing.type: Easing.InOutSine
                                        }
                                    }
                                }
                            }
                        }
                    }

                    Item { height: 16 }

                    // 2. Nội dung hội thoại
                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 12

                        Text {
                            text: "LISTENING..."
                            color: "#81ecff"
                            font.pixelSize: 12; font.weight: Font.Bold; font.letterSpacing: 4
                            Layout.alignment: Qt.AlignHCenter
                        }

                        Text {
                            text: "\"Set the interior to\n72 degrees\""
                            color: "#ffffff"
                            font.pixelSize: 42; font.family: "Manrope"; font.weight: Font.Black
                            horizontalAlignment: Text.AlignHCenter
                            lineHeight: 1.2
                            Layout.alignment: Qt.AlignHCenter
                        }

                        Text {
                            text: "I'm updating your climate settings. Is there\nanything else you need?"
                            color: "#ababac"
                            font.pixelSize: 16; lineHeight: 1.4
                            horizontalAlignment: Text.AlignHCenter
                            Layout.alignment: Qt.AlignHCenter
                            Layout.topMargin: 16
                        }
                    }

                    Item { Layout.fillHeight: true }

                    RowLayout {
                        Layout.alignment: Qt.AlignHCenter
                        spacing: 16

                        ActionBtn { labelText: "Call Office" }
                        ActionBtn { labelText: "Find EV Station" }
                    }

                    Item { height: 20 }
                }
            }
        }
    }
}
