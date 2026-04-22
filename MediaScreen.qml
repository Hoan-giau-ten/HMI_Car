import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Item {
    id: root
    anchors.fill: parent

    RowLayout {
        anchors.fill: parent
        spacing: 32

        // ==========================================
        // CỘT TRÁI: ALBUM ART & BẢNG ĐIỀU KHIỂN CHÍNH
        // ==========================================
        ColumnLayout {
            Layout.fillHeight: true
            // FIX LỖI LAYOUT: Khóa cứng độ rộng bằng 65% màn hình root
            Layout.preferredWidth: root.width * 0.65
            spacing: 24

            // 1. Ảnh Album Art
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 450
                radius: 24
                color: "#191a1b"
                clip: true

                Rectangle {
                    anchors.fill: parent
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#003840" }
                        GradientStop { position: 1.0; color: "#0d0e0f" }
                    }
                }

                Column {
                    anchors { left: parent.left; bottom: parent.bottom; margins: 32 }
                    Text { text: "Electric Horizon"; color: "#ffffff"; font.pixelSize: 48; font.family: "Manrope"; font.weight: Font.ExtraBold }
                    Text { text: "CYBERGLOW ENSEMBLE"; color: "#81ecff"; font.pixelSize: 18; font.letterSpacing: 2; font.weight: Font.Bold }
                }

                // Thanh Equalizer nhấp nháy
                Row {
                    anchors { right: parent.right; bottom: parent.bottom; margins: 32 }
                    spacing: 6
                    Repeater {
                        model: 5
                        Rectangle {
                            width: 6; radius: 3
                            color: "#00e3fd"
                            height: 20 + Math.random() * 30
                            SequentialAnimation on height {
                                loops: Animation.Infinite
                                NumberAnimation { to: 10 + Math.random() * 50; duration: 300 + index * 50; easing.type: Easing.InOutQuad }
                                NumberAnimation { to: 20 + Math.random() * 30; duration: 300 + index * 50; easing.type: Easing.InOutQuad }
                            }
                        }
                    }
                }
            }

            // 2. Bảng điều khiển Playback
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                radius: 24
                color: "#191a1b"

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 32

                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 8
                        Rectangle {
                            Layout.fillWidth: true; height: 6; radius: 3; color: "#252627"
                            Rectangle { width: parent.width * 0.65; height: parent.height; radius: 3; color: "#81ecff" }
                        }
                        RowLayout {
                            Layout.fillWidth: true
                            Text { text: "02:45"; color: "#ababac"; font.pixelSize: 12 }
                            Item { Layout.fillWidth: true }
                            Text { text: "04:12"; color: "#ababac"; font.pixelSize: 12 }
                        }
                    }

                    // Các nút điều khiển
                    RowLayout {
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignHCenter

                        Text { text: "shuffle"; font.family: mainWindow.globalIconFont; color: "#ababac"; font.pixelSize: 32 }
                        Item { Layout.fillWidth: true }

                        RowLayout {
                            spacing: 48
                            Text { text: "skip_previous"; font.family: mainWindow.globalIconFont; color: "#ffffff"; font.pixelSize: 48 }

                            Rectangle {
                                width: 80; height: 80; radius: 40
                                color: "#00e3fd"
                                Text { anchors.centerIn: parent; text: "pause"; font.family: mainWindow.globalIconFont; color: "#003840"; font.pixelSize: 48 }
                            }

                            Text { text: "skip_next"; font.family: mainWindow.globalIconFont; color: "#ffffff"; font.pixelSize: 48 }
                        }

                        Item { Layout.fillWidth: true }
                        Text { text: "repeat"; font.family: mainWindow.globalIconFont; color: "#ababac"; font.pixelSize: 32 }
                    }
                }
            }
        }

        // ==========================================
        // CỘT PHẢI: NGUỒN PHÁT & PLAYLIST
        // ==========================================
        ColumnLayout {
            Layout.fillHeight: true
            // FIX LỖI LAYOUT: Khóa cứng độ rộng bằng 35% màn hình root, chống đè nút
            Layout.preferredWidth: root.width * 0.35
            spacing: 24

            // 1. Chọn nguồn phát
            RowLayout {
                Layout.fillWidth: true
                spacing: 16

                component SourceBtn: Rectangle {
                    property string icon
                    property string label
                    property bool active: false

                    Layout.fillWidth: true
                    Layout.minimumWidth: 60 // Chống bóp méo nút khi màn hình quá nhỏ
                    height: 80; radius: 16
                    color: active ? "#252627" : "#121315"
                    border.width: active ? 2 : 0; border.color: active ? "#81ecff" : "transparent"

                    Column {
                        anchors.centerIn: parent; spacing: 4
                        Text { text: icon; font.family: mainWindow.globalIconFont; color: active ? "#81ecff" : "#ababac"; font.pixelSize: 28; anchors.horizontalCenter: parent.horizontalCenter }
                        Text { text: label; color: active ? "#81ecff" : "#ababac"; font.pixelSize: 10; font.weight: Font.Bold; font.letterSpacing: 1; anchors.horizontalCenter: parent.horizontalCenter }
                    }
                }

                SourceBtn { icon: "graphic_eq"; label: "SPOTIFY"; active: true }
                SourceBtn { icon: "radio"; label: "RADIO" }
                SourceBtn { icon: "bluetooth"; label: "PHONE" }
                SourceBtn { icon: "library_music"; label: "APPLE" }
            }

            // 2. Playlist "Up Next"
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                radius: 24
                color: "#191a1b"

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 24

                    RowLayout {
                        Layout.fillWidth: true
                        Text { text: "Up Next"; color: "#ffffff"; font.pixelSize: 20; font.family: "Manrope"; font.weight: Font.Bold }
                        Item { Layout.fillWidth: true }
                        Text { text: "12 Tracks • 48 min"; color: "#ababac"; font.pixelSize: 12 }
                    }

                    ListView {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        clip: true
                        model: 5
                        spacing: 8
                        delegate: Rectangle {
                            width: parent.width; height: 80; radius: 16
                            color: index === 0 ? "#252627" : "transparent"
                            border.width: index === 0 ? 1 : 0; border.color: index === 0 ? Qt.rgba(129/255, 236/255, 255/255, 0.2) : "transparent"

                            RowLayout {
                                anchors.fill: parent; anchors.margins: 16; spacing: 16
                                Rectangle { width: 48; height: 48; radius: 8; color: "#121315" }
                                Column {
                                    Layout.fillWidth: true; Layout.alignment: Qt.AlignVCenter
                                    Text { text: index === 0 ? "Electric Horizon" : "Neon Pulse " + index; color: index === 0 ? "#81ecff" : "#ffffff"; font.pixelSize: 16; font.weight: Font.Bold }
                                    Text { text: "Cyberglow Ensemble"; color: "#ababac"; font.pixelSize: 12 }
                                }
                                Text {
                                    text: index === 0 ? "equalizer" : "3:42"
                                    font.family: index === 0 ? mainWindow.globalIconFont : "Inter"
                                    color: index === 0 ? "#81ecff" : "#ababac"
                                    font.pixelSize: index === 0 ? 24 : 14
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
