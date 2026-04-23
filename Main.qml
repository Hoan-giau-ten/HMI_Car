import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Window {
    id: mainWindow
    width: 1920
    height: 1080
    visible: true
    title: "The Kinetic Horizon HMI"
    color: "#0d0e0f"

    // ==========================================
    // LOAD FONT TRỰC TIẾP
    // ==========================================
    FontLoader {
        id: materialFont
        source: "qrc:/font/MaterialSymbolsOutlined.ttf"
    }

    property string globalIconFont: materialFont.name
    property string activeTab: "Home"
    property int tempLeft: 68
    property int tempRight: 72

    // ==========================================
    // 1. TOP APP BAR (Header)
    // ==========================================
    Rectangle {
        id: topBar
        height: 80
        anchors { left: parent.left; right: parent.right; top: parent.top }
        color: "#0d0e0f"
        z: 50

        RowLayout {
            anchors.fill: parent
            anchors.margins: 32

            Text {
                text: "THE KINETIC HORIZON"
                font.family: "Manrope"
                font.pixelSize: 24
                font.weight: Font.Black
                color: "#ffffff"
                Layout.alignment: Qt.AlignVCenter
            }

            Row {
                Layout.leftMargin: 48
                spacing: 8
                Layout.alignment: Qt.AlignVCenter
                Text { text: "speed"; font.family: mainWindow.globalIconFont; color: "#00e3fd"; font.pixelSize: 28; anchors.verticalCenter: parent.verticalCenter }

                // MÓC DỮ LIỆU TỐC ĐỘ TỪ C++
                Text { text: Backend.speed; color: "#ffffff"; font.pixelSize: 24; font.family: "Manrope"; font.weight: Font.Black; anchors.verticalCenter: parent.verticalCenter }
                Text { text: "MPH"; color: "#ababac"; font.pixelSize: 12; anchors.baseline: parent.baseline;  }
            }

            Item { Layout.fillWidth: true }

            RowLayout {
                spacing: 24
                Repeater {
                    // Dùng lại mã Unicode siêu nhẹ
                    model: [
                        { icon: "\ue9e4", color: "#ababac" }, // speed
                        { icon: "\ue1a3", color: "#00e3fd" }, // battery_charging_full
                        { icon: "\ue8b5", color: "#ababac" }, // schedule
                        { icon: "\ue80e", color: "#ababac" }, // thermostat
                        { icon: "\ue1c0", color: "#00e3fd" }, // bluetooth
                        { icon: "\ue32a", color: "#ababac" }  // security
                    ]
                    Text {
                        text: modelData.icon
                        font.family: mainWindow.globalIconFont
                        font.pixelSize: 24
                        color: modelData.color
                    }
                }
            }
        }
    }

    // ==========================================
    // 2. SIDE NAV BAR (Menu trái)
    // ==========================================
    Rectangle {
        id: sideBar
        width: 96
        anchors { left: parent.left; top: topBar.bottom; bottom: bottomBar.top }
        color: Qt.rgba(18/255, 19/255, 21/255, 0.6)
        z: 40

        ColumnLayout {
            anchors.fill: parent
            anchors.topMargin: 48
            spacing: 8

            component NavButton: Rectangle {
                property string iconCode
                property string labelText
                property bool isActive: activeTab === labelText

                Layout.fillWidth: true
                height: 90
                color: isActive ? Qt.rgba(129/255, 236/255, 255/255, 0.05) : "transparent"
                border.width: isActive ? 4 : 0
                border.color: isActive ? "#00e3fd" : "transparent"

                Rectangle {
                    width: 4; height: parent.height
                    anchors.right: parent.right
                    color: "#00e3fd"
                    visible: parent.isActive
                }

                Column {
                    anchors.centerIn: parent
                    spacing: 4
                    Text {
                        text: iconCode
                        font.family: materialFont.name // <--- GÁN FONT Ở ĐÂY
                        font.pixelSize: 32
                        color: isActive ? "#81ecff" : "#ababac"
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    Text {
                        text: labelText
                        font.pixelSize: 10
                        font.weight: isActive ? Font.Bold : Font.Medium
                        color: isActive ? "#81ecff" : "#ababac"
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: activeTab = labelText
                }

                Behavior on color { ColorAnimation { duration: 200 } }
            }

            NavButton { iconCode: "\ue88a"; labelText: "Home" }
            NavButton { iconCode: "\ue55b"; labelText: "Map" }
            NavButton { iconCode: "\ue039"; labelText: "Media" }
            NavButton { iconCode: "\ue0cd"; labelText: "Phone" }
            NavButton { iconCode: "\ue531"; labelText: "Vehicle" }
            NavButton { iconCode: "\ue8b8"; labelText: "Settings" }

            Item { Layout.fillHeight: true }
        }
    }

    // ==========================================
    // 3. MAIN CONTENT AREA (Khu vực giữa)
    // ==========================================
    Item {
        id: mainContent
        anchors { left: sideBar.right; right: parent.right; top: topBar.bottom; bottom: bottomBar.top }
        anchors.margins: 32 // Thêm lề cho màn hình thở một chút

        Loader {
            anchors.fill: parent
            source: {
                if (activeTab === "Home") return "HomeScreen.qml" // <--- THÊM DÒNG NÀY
                if (activeTab === "Media") return "MediaScreen.qml"
                if (activeTab === "Vehicle") return "VehicleScreen.qml"
                if (activeTab === "Settings") return "SettingsScreen.qml"
                if (activeTab === "Phone") return "PhoneScreen.qml"
                return ""
            }
        }

        Text {
            anchors.centerIn: parent
            visible: (activeTab !== "Home" && activeTab !== "Media" && activeTab !== "Vehicle" && activeTab !== "Settings" && activeTab !== "Phone")
            text: activeTab + " Screen Placeholder"
            color: "#ababac"
            font.pixelSize: 32
        }
    }

    // ==========================================
    // 4. BOTTOM CLIMATE BAR
    // ==========================================
    Rectangle {
        id: bottomBar
        height: 112
        anchors { left: sideBar.right; right: parent.right; bottom: parent.bottom }
        color: "#000000"
        radius: 32

        Rectangle {
            anchors { bottom: parent.bottom; left: parent.left; right: parent.right }
            height: 32
            color: "#000000"
        }

        RowLayout {
                    anchors.fill: parent
                    anchors.margins: 48

                    // ------------------------------------------
                    // CHỖ SỬA 1: CỤM NHIỆT ĐỘ TRÁI (Ghế Lái)
                    // ------------------------------------------
                    RowLayout {
                        Layout.alignment: Qt.AlignVCenter
                        spacing: 16

                        // Nút Giảm nhiệt độ
                        Text {
                            text: "chevron_left"; font.family: mainWindow.globalIconFont; color: "#ababac"; font.pixelSize: 32
                            MouseArea { anchors.fill: parent; onClicked: ClimateAPI.decreaseLeftTemp() }
                        }

                        // Hiển thị nhiệt độ móc từ C++
                        Column {
                            Text { text: ClimateAPI.leftTemp + "°"; color: "#ffffff"; font.pixelSize: 32; font.weight: Font.Bold; anchors.horizontalCenter: parent.horizontalCenter }
                            Text { text: "TEMP L"; color: "#ababac"; font.pixelSize: 10; font.letterSpacing: 2; anchors.horizontalCenter: parent.horizontalCenter }
                        }

                        // Nút Tăng nhiệt độ
                        Text {
                            text: "chevron_right"; font.family: mainWindow.globalIconFont; color: "#ababac"; font.pixelSize: 32
                            MouseArea { anchors.fill: parent; onClicked: ClimateAPI.increaseLeftTemp() }
                        }
                    }

                    Item { Layout.fillWidth: true } // Khoảng trống đẩy cụm quạt ra giữa

                    // ------------------------------------------
                    // CỤM NÚT QUẠT GIÓ (Ở GIỮA) - Giữ nguyên
                    // ------------------------------------------
                    RowLayout {
                        spacing: 48

                        Column {
                            Text { text: "\ue02c"; font.family: materialFont.name; font.pixelSize: 32; color: "#ababac"; anchors.horizontalCenter: parent.horizontalCenter }
                            Text { text: "CLIMATE"; color: "#ababac"; font.pixelSize: 10; font.letterSpacing: 2; anchors.horizontalCenter: parent.horizontalCenter }
                        }

                        Rectangle {
                            width: 120; height: 64
                            color: Qt.rgba(129/255, 236/255, 255/255, 0.1)
                            radius: 16
                            border.width: 1; border.color: Qt.rgba(129/255, 236/255, 255/255, 0.2)

                            Column {
                                anchors.centerIn: parent
                                Text { text: "\ue953"; font.family: materialFont.name; font.pixelSize: 32; color: "#81ecff"; anchors.horizontalCenter: parent.horizontalCenter }
                                Text { text: "FAN MAX"; color: "#81ecff"; font.pixelSize: 10; font.bold: true; font.letterSpacing: 2; anchors.horizontalCenter: parent.horizontalCenter }
                            }
                        }

                        Column {
                            Text { text: "\ue636"; font.family: materialFont.name; font.pixelSize: 32; color: "#ababac"; anchors.horizontalCenter: parent.horizontalCenter }
                            Text { text: "SEAT"; color: "#ababac"; font.pixelSize: 10; font.letterSpacing: 2; anchors.horizontalCenter: parent.horizontalCenter }
                        }
                    }

                    Item { Layout.fillWidth: true } // Khoảng trống đẩy cụm ghế phụ sang phải

                    // ------------------------------------------
                    // CHỖ SỬA 2: CỤM NHIỆT ĐỘ PHẢI (Ghế Phụ)
                    // ------------------------------------------
                    RowLayout {
                        Layout.alignment: Qt.AlignVCenter
                        spacing: 16

                        // Nút Giảm nhiệt độ
                        Text {
                            text: "chevron_left"; font.family: mainWindow.globalIconFont; color: "#ababac"; font.pixelSize: 32
                            MouseArea { anchors.fill: parent; onClicked: ClimateAPI.decreaseRightTemp() }
                        }

                        // Hiển thị nhiệt độ móc từ C++
                        Column {
                            Text { text: ClimateAPI.rightTemp + "°"; color: "#ffffff"; font.pixelSize: 32; font.weight: Font.Bold; anchors.horizontalCenter: parent.horizontalCenter }
                            Text { text: "TEMP R"; color: "#ababac"; font.pixelSize: 10; font.letterSpacing: 2; anchors.horizontalCenter: parent.horizontalCenter }
                        }

                        // Nút Tăng nhiệt độ
                        Text {
                            text: "chevron_right"; font.family: mainWindow.globalIconFont; color: "#ababac"; font.pixelSize: 32
                            MouseArea { anchors.fill: parent; onClicked: ClimateAPI.increaseRightTemp() }
                        }
                    }
                }
    }
}
