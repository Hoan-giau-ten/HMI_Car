import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import "components"

Item {
    id: root
    anchors.fill: parent

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 40
        spacing: 32

        // ==========================================
        // HEADER: TIÊU ĐỀ & TRẠNG THÁI KẾT NỐI
        // ==========================================
        RowLayout {
            Layout.fillWidth: true

            Column {
                Layout.alignment: Qt.AlignVCenter
                Text {
                    text: "Communication"
                    color: "#ffffff"
                    font.pixelSize: 42
                    font.family: "Manrope"
                    font.weight: Font.ExtraBold
                }
                Row {
                    spacing: 8
                    Text { text: "Connected via"; color: "#ababac"; font.pixelSize: 16 }
                    Text { text: "Kinetic_iPhone_15"; color: "#00e3fd"; font.pixelSize: 16; font.weight: Font.Bold }
                }
            }

            Item { Layout.fillWidth: true } // Spacer

            // Các nút tiện ích góc phải
            Row {
                spacing: 16
                HeaderBtn { icon: "contacts" }
                HeaderBtn { icon: "star" }
            }
        }

        // ==========================================
        // BODY: 3 CỘT NỘI DUNG CHÍNH
        // ==========================================
        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 32

            // ------------------------------------------
            // CỘT 1: BÀN PHÍM SỐ (DIALPAD)
            // ------------------------------------------
            Rectangle {
                Layout.fillHeight: true
                Layout.preferredWidth: root.width * 0.3
                radius: 24
                color: "#191a1b"
                border.width: 1; border.color: "#252627"

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 32
                    spacing: 24

                    // Số đang bấm
                    Text {
                        Layout.fillWidth: true
                        text: "+1 (555) 012-3456"
                        color: "#ffffff"
                        font.pixelSize: 36
                        font.family: "Manrope"
                        horizontalAlignment: Text.AlignRight
                    }

                    Item { Layout.fillHeight: true } // Đẩy numpad xuống một chút

                    // Lưới phím
                    GridLayout {
                        Layout.alignment: Qt.AlignHCenter
                        columns: 3
                        rowSpacing: 16
                        columnSpacing: 16

                        DialKey { number: "1"; letters: "VOICEMAIL" }
                        DialKey { number: "2"; letters: "ABC" }
                        DialKey { number: "3"; letters: "DEF" }
                        DialKey { number: "4"; letters: "GHI" }
                        DialKey { number: "5"; letters: "JKL" }
                        DialKey { number: "6"; letters: "MNO" }
                        DialKey { number: "7"; letters: "PQRS" }
                        DialKey { number: "8"; letters: "TUV" }
                        DialKey { number: "9"; letters: "WXYZ" }
                        DialKey { number: "*"; letters: "" }
                        DialKey { number: "0"; letters: "+" }
                        DialKey { number: "#"; letters: "" }
                    }

                    Item { Layout.fillHeight: true }

                    // Nút CALL
                    Rectangle {
                        Layout.fillWidth: true
                        height: 72; radius: 24
                        color: "#00e3fd" // Màu Cyan nổi bật

                        Row {
                            anchors.centerIn: parent; spacing: 12
                            Text { text: "call"; font.family: mainWindow.globalIconFont; color: "#003840"; font.pixelSize: 32; anchors.verticalCenter: parent.verticalCenter }
                            Text { text: "CALL"; color: "#003840"; font.pixelSize: 20; font.family: "Manrope"; font.weight: Font.Black; font.letterSpacing: 2; anchors.verticalCenter: parent.verticalCenter }
                        }

                        MouseArea {
                            anchors.fill: parent
                            onPressed: parent.opacity = 0.8
                            onReleased: parent.opacity = 1.0
                        }
                    }
                }
            }

            // ------------------------------------------
            // CỘT 2: LỊCH SỬ CUỘC GỌI
            // ------------------------------------------
            Rectangle {
                Layout.fillHeight: true
                Layout.fillWidth: true
                radius: 24
                color: "#191a1b"
                border.width: 1; border.color: "#252627"

                ColumnLayout {
                    anchors.fill: parent

                    // Header của cột
                    Rectangle {
                        Layout.fillWidth: true; height: 72
                        color: "#252627"; radius: 24
                        Rectangle { anchors.bottom: parent.bottom; width: parent.width; height: 24; color: "#191a1b" } // Xóa bo góc viền dưới

                        RowLayout {
                            anchors.fill: parent; anchors.margins: 24
                            Text { text: "Recent Activity"; color: "#ffffff"; font.pixelSize: 20; font.family: "Manrope"; font.weight: Font.Bold }
                            Item { Layout.fillWidth: true }
                            Text { text: "Clear"; color: "#00e3fd"; font.pixelSize: 14; font.weight: Font.Bold }
                        }
                    }

                    // Danh sách
                    ListView {
                        Layout.fillWidth: true; Layout.fillHeight: true
                        clip: true; interactive: false
                        model: [
                            { name: "Julian Vance", status: "Missed • 14:20", icon: "call_received", color: "#ff716c", avaColor: "#454749", avaText: "JV" },
                            { name: "Elena Moretti", status: "Mobile • 12:45", icon: "call_made", color: "#81ecff", avaColor: "#fc3c00", avaText: "EM" },
                            { name: "Sarah Connor", status: "Incoming • 09:12", icon: "call_received", color: "#ababac", avaColor: "#252627", avaText: "SC" }
                        ]
                        delegate: Item {
                            width: parent.width; height: 88
                            RowLayout {
                                anchors.fill: parent; anchors.margins: 16; spacing: 16

                                // Avatar giả lập
                                Rectangle {
                                    width: 56; height: 56; radius: 28; color: modelData.avaColor
                                    Text { anchors.centerIn: parent; text: modelData.avaText; color: "#ffffff"; font.weight: Font.Bold; font.pixelSize: 20 }
                                }

                                Column {
                                    Layout.fillWidth: true; spacing: 4; Layout.alignment: Qt.AlignVCenter
                                    Text { text: modelData.name; color: "#ffffff"; font.pixelSize: 18; font.family: "Manrope"; font.weight: Font.Bold }
                                    Row {
                                        spacing: 4
                                        Text { text: modelData.icon; font.family: mainWindow.globalIconFont; color: modelData.color; font.pixelSize: 14 }
                                        Text { text: modelData.status; color: "#ababac"; font.pixelSize: 14 }
                                    }
                                }

                                Text { text: "call"; font.family: mainWindow.globalIconFont; color: "#ababac"; font.pixelSize: 28 }
                            }
                        }
                    }
                }
            }

            // ------------------------------------------
            // CỘT 3: TIN NHẮN ĐẾN
            // ------------------------------------------
            Rectangle {
                Layout.fillHeight: true
                Layout.fillWidth: true
                radius: 24
                color: "#191a1b"
                border.width: 1; border.color: "#252627"

                ColumnLayout {
                    anchors.fill: parent

                    // Header của cột
                    Rectangle {
                        Layout.fillWidth: true; height: 72
                        color: "#252627"; radius: 24
                        Rectangle { anchors.bottom: parent.bottom; width: parent.width; height: 24; color: "#191a1b" }

                        RowLayout {
                            anchors.fill: parent; anchors.margins: 24
                            Text { text: "Incoming Messages"; color: "#ffffff"; font.pixelSize: 20; font.family: "Manrope"; font.weight: Font.Bold }
                            Item { Layout.fillWidth: true }
                            Row {
                                spacing: 6; anchors.verticalCenter: parent.verticalCenter
                                Rectangle { width: 8; height: 8; radius: 4; color: "#00e3fd"; anchors.verticalCenter: parent.verticalCenter }
                                Text { text: "LIVE"; color: "#00e3fd"; font.pixelSize: 10; font.weight: Font.Bold; font.letterSpacing: 1 }
                            }
                        }
                    }

                    // Vùng chứa tin nhắn
                    ColumnLayout {
                        Layout.fillWidth: true; Layout.fillHeight: true
                        anchors.margins: 24; spacing: 20

                        // Thẻ tin nhắn 1 (Có viền phát sáng Cyan)
                        Rectangle {
                            Layout.fillWidth: true; height: 180; radius: 20
                            color: "#121315"
                            border.width: 1; border.color: "#252627"

                            // Viền trái màu Cyan
                            Rectangle { width: 4; height: parent.height - 32; color: "#00e3fd"; radius: 2; anchors.left: parent.left; anchors.verticalCenter: parent.verticalCenter }

                            ColumnLayout {
                                anchors.fill: parent; anchors.margins: 20; spacing: 12
                                RowLayout {
                                    Layout.fillWidth: true; spacing: 12
                                    Rectangle { width: 40; height: 40; radius: 20; color: "#454749"; Text { anchors.centerIn: parent; text: "MT"; color: "#fff"; font.weight: Font.Bold } }
                                    Column {
                                        Layout.fillWidth: true
                                        Text { text: "Marcus Thorne"; color: "#ffffff"; font.pixelSize: 16; font.weight: Font.Bold }
                                        Text { text: "2 mins ago"; color: "#ababac"; font.pixelSize: 12 }
                                    }
                                    Text { text: "chat_bubble"; font.family: mainWindow.globalIconFont; color: "#00e3fd"; font.pixelSize: 24 }
                                }
                                Text {
                                    Layout.fillWidth: true
                                    text: "\"Hey, just confirming our meeting at the Horizon Club at 7. See you there!\""
                                    color: "#ffffff"; font.pixelSize: 15; wrapMode: Text.WordWrap; lineHeight: 1.3
                                }
                                RowLayout {
                                    Layout.fillWidth: true; spacing: 12
                                    Rectangle { Layout.fillWidth: true; height: 44; radius: 12; color: "#252627"; Row { anchors.centerIn: parent; spacing: 8; Text { text: "volume_up"; font.family: mainWindow.globalIconFont; color: "#fff" } Text { text: "Read Aloud"; color: "#fff"; font.weight: Font.Bold } } }
                                    Rectangle { Layout.fillWidth: true; height: 44; radius: 12; color: "#252627"; Row { anchors.centerIn: parent; spacing: 8; Text { text: "reply"; font.family: mainWindow.globalIconFont; color: "#fff" } Text { text: "Reply"; color: "#fff"; font.weight: Font.Bold } } }
                                }
                            }
                        }

                        // Thẻ tin nhắn 2 (Hệ thống)
                        Rectangle {
                            Layout.fillWidth: true; height: 100; radius: 20
                            color: "#121315"; opacity: 0.8
                            border.width: 1; border.color: "#252627"

                            ColumnLayout {
                                anchors.fill: parent; anchors.margins: 20; spacing: 8
                                RowLayout {
                                    Layout.fillWidth: true; spacing: 12
                                    Rectangle { width: 40; height: 40; radius: 20; color: "#252627"; Text { anchors.centerIn: parent; text: "home_work"; font.family: mainWindow.globalIconFont; color: "#ababac" } }
                                    Column {
                                        Layout.fillWidth: true
                                        Text { text: "Office Security"; color: "#ffffff"; font.pixelSize: 16; font.weight: Font.Bold }
                                        Text { text: "1 hour ago"; color: "#ababac"; font.pixelSize: 12 }
                                    }
                                }
                                Text {
                                    Layout.fillWidth: true
                                    text: "Main lobby gates are now operational with your mobile pass."
                                    color: "#ababac"; font.pixelSize: 13; wrapMode: Text.WordWrap
                                }
                            }
                        }

                        Item { Layout.fillHeight: true }
                    }
                }
            }
        }
    }
}
