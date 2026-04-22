import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtLocation       // Thư viện Bản đồ
import QtPositioning    // Thư viện Tọa độ

Item {
    id: root
    anchors.fill: parent

    RowLayout {
        anchors.fill: parent
        anchors.margins: 40
        spacing: 32

        // ==========================================
        // CỘT TRÁI: REAL MAP (BẢN ĐỒ THẬT)
        // ==========================================
        Rectangle {
            Layout.fillHeight: true
            Layout.preferredWidth: root.width * 0.58
            radius: 24
            color: "#121315"
            border.width: 1; border.color: "#252627"
            clip: true // Cắt những phần bản đồ tràn ra ngoài góc bo tròn

            // Plugin kết nối với OpenStreetMap
            Plugin {
                id: mapPlugin
                name: "osm"
                // Tùy chọn ẩn logo/watermark của OSM để giao diện sạch hơn
                PluginParameter { name: "osm.mapping.copyright"; value: "" }
            }

            // Bản đồ thật (Real Map)
            Map {
                anchors.fill: parent
                plugin: mapPlugin
                // Tọa độ San Francisco (Giống trong thiết kế)
                center: QtPositioning.coordinate(37.7749, -122.4194)
                zoomLevel: 13.5

                // Widget Điều hướng (Navigation Overlay)
                Rectangle {
                    x: 24; y: 24
                    width: 320; height: 140; radius: 20
                    color: Qt.rgba(37/255, 38/255, 39/255, 0.85) // Kính mờ
                    border.width: 1; border.color: Qt.rgba(129/255, 236/255, 255/255, 0.2)

                    ColumnLayout {
                        anchors.fill: parent; anchors.margins: 20

                        RowLayout {
                            Layout.fillWidth: true
                            Column {
                                Text { text: "0.8 MI"; color: "#81ecff"; font.pixelSize: 32; font.family: "Manrope"; font.weight: Font.ExtraBold }
                                Text { text: "Ocean Boulevard"; color: "#ffffff"; font.pixelSize: 16 }
                            }
                            Item { Layout.fillWidth: true }
                            // Nút rẽ phải
                            Rectangle {
                                width: 48; height: 48; radius: 12; color: Qt.rgba(129/255, 236/255, 255/255, 0.2)
                                Text { anchors.centerIn: parent; text: "turn_right"; font.family: mainWindow.globalIconFont; color: "#81ecff"; font.pixelSize: 28 }
                            }
                        }

                        Item { Layout.fillHeight: true } // Spacer

                        // Thanh tiến trình chuyến đi
                        Rectangle { Layout.fillWidth: true; height: 4; radius: 2; color: "#252627"; Rectangle { width: parent.width * 0.7; height: 4; radius: 2; color: "#81ecff" } }

                        RowLayout {
                            Layout.fillWidth: true
                            Text { text: "12:54 PM"; color: "#ababac"; font.pixelSize: 12 }
                            Item { Layout.fillWidth: true }
                            Text { text: "14 MINS"; color: "#ababac"; font.pixelSize: 12 }
                        }
                    }
                }

                // Cụm nút Zoom (+/-)
                Column {
                    anchors { right: parent.right; bottom: parent.bottom; margins: 24 }
                    spacing: 8

                    component MapBtn: Rectangle {
                        property string iconName
                        width: 48; height: 48; radius: 16
                        color: Qt.rgba(37/255, 38/255, 39/255, 0.85)
                        border.width: 1; border.color: "#454749"
                        Text { anchors.centerIn: parent; text: iconName; font.family: mainWindow.globalIconFont; color: "#ffffff"; font.pixelSize: 24 }
                        MouseArea { anchors.fill: parent; onClicked: parent.color = "#454749"; onReleased: parent.color = Qt.rgba(37/255, 38/255, 39/255, 0.85) }
                    }

                    MapBtn { iconName: "add" }
                    MapBtn { iconName: "remove" }
                    MapBtn { iconName: "explore" }
                }
            }
        }

        // ==========================================
        // CỘT PHẢI: VEHICLE & MEDIA WIDGETS
        // ==========================================
        ColumnLayout {
            Layout.fillHeight: true
            Layout.fillWidth: true
            spacing: 24

            // ------------------------------------------
            // 1. VEHICLE ALPHA WIDGET
            // ------------------------------------------
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                radius: 24
                color: "#151618"
                border.width: 1; border.color: "#252627"

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 32
                    spacing: 16

                    // Header
                    RowLayout {
                        Layout.fillWidth: true
                        Column {
                            Text { text: "VEHICLE ALPHA"; color: "#ffffff"; font.pixelSize: 20; font.family: "Manrope"; font.weight: Font.Bold }
                            // Trạng thái đổi theo isDriving
                            Text { text: Backend.isDriving ? "SYSTEMS RUNNING..." : "ALL SYSTEMS OPTIMAL"; color: Backend.isDriving ? "#00e3fd" : "#ababac"; font.pixelSize: 11; font.letterSpacing: 2 }
                        }
                        Item { Layout.fillWidth: true }

                        // BIẾN THÀNH NÚT BẤM ĐỂ CHẠY/DỪNG XE
                        Rectangle {
                            width: 120; height: 32; radius: 8
                            color: Backend.isDriving ? "#ff716c" : Qt.rgba(129/255, 236/255, 255/255, 0.1)
                            border.width: 1; border.color: Backend.isDriving ? "#ff716c" : "transparent"

                            Text {
                                anchors.centerIn: parent
                                text: Backend.isDriving ? "STOP ENGINE" : "START ENGINE"
                                color: Backend.isDriving ? "#ffffff" : "#81ecff"
                                font.pixelSize: 10; font.weight: Font.Bold
                            }

                            MouseArea {
                                anchors.fill: parent
                                // Gọi thẳng hàm C++ khi click
                                onClicked: Backend.setIsDriving(!Backend.isDriving)
                            }
                        }
                    }

                    // HÌNH ẢNH XE ĐÃ THAY BẰNG ẢNH THẬT
                    Rectangle {
                        anchors.horizontalCenter: parent.horizontalCenter
                        Layout.preferredWidth: 240
                        Layout.preferredHeight: 240
                        radius: 16
                        color: "#0a0e14" // Lót nền màu tối bo tròn
                        clip: true // Ép tấm ảnh bo góc theo cái viền Rectangle này

                        Image {
                            anchors.fill: parent
                            source: "qrc:/images/image_carItem.png" // Load thẳng ảnh thật của bạn
                            fillMode: Image.PreserveAspectCrop // Cắt cho đầy đặn cái viền
                        }
                    }

                    // Thông số (Range & Battery)
                    RowLayout {
                        Layout.fillWidth: true
                        Item { Layout.fillWidth: true }
                        Column {
                            Text { text: "RANGE"; color: "#ababac"; font.pixelSize: 10; font.weight: Font.Bold; font.letterSpacing: 1; anchors.horizontalCenter: parent.horizontalCenter }
                            Row {
                                anchors.horizontalCenter: parent.horizontalCenter
                                spacing: 4
                                Text { text: Backend.range; color: "#ffffff"; font.pixelSize: 28; font.family: "Manrope"; font.weight: Font.Black }
                                Text { text: "MI"; color: "#ababac"; font.pixelSize: 12; anchors.baseline: parent.baseline }
                            }
                        }
                        Item { Layout.preferredWidth: 60 }
                        Column {
                            Text { text: "BATTERY"; color: "#ababac"; font.pixelSize: 10; font.weight: Font.Bold; font.letterSpacing: 1; anchors.horizontalCenter: parent.horizontalCenter }
                            Row {
                                anchors.horizontalCenter: parent.horizontalCenter
                                spacing: 4
                                Text { text: Backend.batteryLevel + " %"; color: "#81ecff"; font.pixelSize: 28; font.family: "Manrope"; font.weight: Font.Black }
                            }
                        }
                        Item { Layout.fillWidth: true }
                    }

                    // 2 Pills (Cabin & Tires)
                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 16

                        component StatusPill: Rectangle {
                            property string icon
                            property string title
                            property string val
                            Layout.fillWidth: true; height: 60; radius: 16; color: "#191a1b"; border.width: 1; border.color: "#252627"
                            RowLayout {
                                anchors.centerIn: parent; spacing: 12
                                Text { text: icon; font.family: mainWindow.globalIconFont; color: "#ababac"; font.pixelSize: 24 }
                                Column {
                                    Text { text: title; color: "#ababac"; font.pixelSize: 10; font.weight: Font.Bold }
                                    Text { text: val; color: "#ffffff"; font.pixelSize: 16; font.weight: Font.Bold }
                                }
                            }
                        }
                        StatusPill { icon: "thermostat"; title: "CABIN"; val: "72°F" }
                        StatusPill { icon: "tire_repair"; title: "TIRES"; val: "36 PSI" }
                    }
                }
            }

            // ------------------------------------------
            // 2. MEDIA WIDGET
            // ------------------------------------------
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 200
                radius: 24
                color: "#151618"
                border.width: 1; border.color: "#252627"

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 24
                    spacing: 24

                    // ALBUM ART ĐÃ THAY BẰNG ẢNH THẬT
                    Rectangle {
                        width: 140; height: 140; radius: 24 // Chuyển từ tròn thành hình vuông bo góc hiện đại
                        color: "#050505"
                        border.width: 1; border.color: "#252627"
                        clip: true // Bo góc bức ảnh bên trong

                        Image {
                            anchors.fill: parent
                            source: "qrc:/images/image_song.png" // Load ảnh bài hát
                            fillMode: Image.PreserveAspectCrop
                        }
                    }

                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 12

                        // Tên Bài hát & Ca sĩ từ C++
                        Column {
                            Text { text: MediaAPI.songTitle; color: "#ffffff"; font.pixelSize: 22; font.family: "Manrope"; font.weight: Font.Bold }
                            Text { text: MediaAPI.songArtist; color: "#81ecff"; font.pixelSize: 14 }
                        }

                        // Thanh tiến trình chạy thật
                        ColumnLayout {
                            Layout.fillWidth: true; spacing: 4
                            Rectangle {
                                Layout.fillWidth: true; height: 4; radius: 2; color: "#252627"

                                // Chiều dài thanh Cyan thay đổi theo % bài hát
                                Rectangle { width: parent.width * MediaAPI.progress; height: 4; radius: 2; color: "#81ecff" }

                                // Chấm tròn (Thumb)
                                Rectangle { x: parent.width * MediaAPI.progress - 6; anchors.verticalCenter: parent.verticalCenter; width: 12; height: 12; radius: 6; color: "#ffffff" }
                            }

                            // Thời gian thật 01:20 / 03:45
                            RowLayout {
                                Layout.fillWidth: true
                                Text { text: MediaAPI.positionTime; color: "#ababac"; font.pixelSize: 10 }
                                Item { Layout.fillWidth: true }
                                Text { text: MediaAPI.durationTime; color: "#ababac"; font.pixelSize: 10 }
                            }
                        }

                        // Controls (Next, Prev, Play)
                        RowLayout {
                            Layout.fillWidth: true
                            spacing: 24
                            Text { text: "shuffle"; font.family: mainWindow.globalIconFont; color: "#ababac"; font.pixelSize: 24 }

                            // Nút Lùi bài
                            Text {
                                text: "skip_previous"; font.family: mainWindow.globalIconFont; color: "#ffffff"; font.pixelSize: 32
                                MouseArea { anchors.fill: parent; onClicked: MediaAPI.prevTrack() }
                            }

                            // Nút Play / Pause
                            Rectangle {
                                width: 56; height: 56; radius: 20; color: "#00e3fd"
                                Text { anchors.centerIn: parent; text: MediaAPI.isPlaying ? "pause" : "play_arrow"; font.family: mainWindow.globalIconFont; color: "#003840"; font.pixelSize: 32 }
                                MouseArea { anchors.fill: parent; onClicked: MediaAPI.togglePlayPause() }
                            }

                            // Nút Qua bài
                            Text {
                                text: "skip_next"; font.family: mainWindow.globalIconFont; color: "#ffffff"; font.pixelSize: 32
                                MouseArea { anchors.fill: parent; onClicked: MediaAPI.nextTrack() }
                            }

                            Text { text: "repeat"; font.family: mainWindow.globalIconFont; color: "#ababac"; font.pixelSize: 24 }
                        }
                    }
                }
            }
        }
    }
}
