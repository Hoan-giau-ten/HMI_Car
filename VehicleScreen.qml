import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import "components"

Item {
    id: root
    anchors.fill: parent

    RowLayout {
        anchors.fill: parent
        spacing: 40

        // ==========================================
        // CỘT TRÁI: VEHICLE SHOWCASE CARD
        // ==========================================
        Rectangle {
            Layout.fillHeight: true
            Layout.preferredWidth: root.width * 0.55
            radius: 24
            color: "#151618"
            border.width: 1
            border.color: "#252627"

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 32
                spacing: 24

                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    radius: 20
                    border.width: 1
                    border.color: "#1e2021"
                    clip: true

                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#001a24" } // Xanh dương đen sâu thẳm ở trên
                        GradientStop { position: 0.5; color: "#0a0e14" } // Đen chuyển tiếp
                        GradientStop { position: 1.0; color: "#05070a" } // Đen tuyền ở dưới
                    }

                    Rectangle {
                        anchors.centerIn: parent
                        width: parent.width * 0.8; height: parent.height * 0.8; radius: width/2
                        color: Qt.rgba(0, 227/255, 253/255, 0.05) // Cyan glow cực nhẹ
                    }

                    Image {
                        id: carModel
                        anchors.fill: parent
                        source: "qrc:/images/image_vehicle.png"
                        fillMode: Image.PreserveAspectCrop
                    }

                    TireLabel { title: "FRONT LEFT";  psi: "34"; anchors { left: parent.left; leftMargin: 40; top: parent.top; topMargin: 60 } }
                    TireLabel { title: "FRONT RIGHT"; psi: "35"; anchors { right: parent.right; rightMargin: 40; top: parent.top; topMargin: 60 } }
                    TireLabel { title: "REAR LEFT";   psi: "34"; anchors { left: parent.left; leftMargin: 40; bottom: parent.bottom; bottomMargin: 60 } }
                    TireLabel { title: "REAR RIGHT";  psi: "34"; anchors { right: parent.right; rightMargin: 40; bottom: parent.bottom; bottomMargin: 60 } }
                }

                RowLayout {
                    Layout.alignment: Qt.AlignHCenter
                    spacing: 24

                    Repeater {
                        model: ["lock_open", "shopping_bag", "sensor_door"]

                        Rectangle {
                            width: 60
                            height: 60
                            radius: 16
                            color: "#1d1e20"
                            border.width: 1
                            border.color: "#2b2c2e"

                            Text {
                                anchors.centerIn: parent
                                text: modelData
                                font.family: mainWindow.globalIconFont
                                color: "#ababac"
                                font.pixelSize: 24
                            }

                            MouseArea {
                                anchors.fill: parent
                                onPressed: parent.color = "#2b2c2e"
                                onReleased: parent.color = "#1d1e20"
                            }
                        }
                    }
                }
            }
        }

        ColumnLayout {
            Layout.fillHeight: true
            Layout.preferredWidth: root.width * 0.45
            spacing: 28

            ColumnLayout {
                Layout.fillWidth: true
                spacing: 16

                Text {
                    text: "DRIVING DYNAMICS"
                    color: "#ababac"
                    font.pixelSize: 11
                    font.letterSpacing: 3
                    font.weight: Font.Bold
                }

                Rectangle {
                    Layout.fillWidth: true
                    height: 64
                    radius: 16
                    color: "#121315"
                    border.width: 1; border.color: "#1e2021"

                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 4
                        spacing: 4

                        Rectangle {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            radius: 12
                            color: "transparent"

                            Text {
                                anchors.centerIn: parent
                                text: "Chill"
                                color: "#ababac"
                                font.weight: Font.Bold
                            }
                        }

                        Rectangle {
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            radius: 12
                            color: "#00e3fd"

                            Text {
                                anchors.centerIn: parent
                                text: "Spot"
                                color: "#003840"
                                font.weight: Font.Black
                                font.letterSpacing: 1
                            }
                        }

                        Rectangle {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            radius: 12
                            color: "transparent"

                            Text {
                                anchors.centerIn: parent
                                text: "Insane"
                                color: "#ababac"
                                font.weight: Font.Bold
                            }
                        }
                    }
                }
            }

            ColumnLayout {
                Layout.fillWidth: true
                spacing: 16

                Text {
                    text: "ACTIVE SAFETY (ADAS)"
                    color: "#ababac"
                    font.pixelSize: 11
                    font.letterSpacing: 3
                    font.weight: Font.Bold
                }

                AdasToggle {
                    icon: "auto_fix_high"
                    title: "Autopilot"
                    subtitle: "Enhanced Traffic Aware Cruise"
                    isOn: true
                }
                AdasToggle {
                    icon: "edit_road"
                    title: "Lane Keeping"
                    subtitle: "Vibration and Steering Assist"
                    iconColor: "#ababac"
                }
                AdasToggle {
                    icon: "emergency_home"
                    title: "Emergency Braking"
                    subtitle: "Critical Collision Avoidance"
                    iconColor: "#ff716c"
                    isOn: true
                }

                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 16

                    Text {
                        text: "VEHICLE LIGHTING"
                        color: "#ababac"
                        font.pixelSize: 11
                        font.letterSpacing: 3
                        font.weight: Font.Bold
                    }

                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 16

                        Rectangle {
                            Layout.fillWidth: true
                            height: 100
                            radius: 20
                            color: "#121315"
                            border.width: 1
                            border.color: "#252627"

                            ColumnLayout {
                                anchors.fill: parent
                                anchors.margins: 20

                                RowLayout {
                                    Layout.fillWidth: true
                                    Text {
                                        text: "light_mode"
                                        font.family: mainWindow.globalIconFont
                                        color: "#81ecff"
                                        font.pixelSize: 28
                                    }

                                    Item {
                                        Layout.fillWidth: true
                                    }

                                    Text {
                                        text: "AUTO"
                                        color: "#81ecff"
                                        font.pixelSize: 12
                                        font.weight: Font.Bold
                                        font.letterSpacing: 1
                                    }
                                }

                                Item {
                                    Layout.fillHeight: true
                                }

                                Text {
                                    text: "Headlights"
                                    color: "#ffffff"
                                    font.pixelSize: 16
                                    font.weight: Font.Bold
                                }
                            }
                        }

                        Rectangle {
                            Layout.fillWidth: true
                            height: 100
                            radius: 20
                            color: "#121315"
                            border.width: 1
                            border.color: "#252627"

                            ColumnLayout {
                                anchors.fill: parent
                                anchors.margins: 20

                                RowLayout {
                                    Layout.fillWidth: true
                                    Text {
                                        text: "foggy"
                                        font.family: mainWindow.globalIconFont
                                        color: "#ababac"
                                        font.pixelSize: 28
                                    }

                                    Item {
                                        Layout.fillWidth: true
                                    }

                                    Text {
                                        text: "OFF"
                                        color: "#ababac"
                                        font.pixelSize: 12
                                        font.weight: Font.Bold
                                        font.letterSpacing: 1
                                    }
                                }

                                Item {
                                    Layout.fillHeight: true
                                }

                                Text {
                                    text: "Fog Lights"
                                    color: "#ababac"
                                    font.pixelSize: 16
                                    font.weight: Font.Bold
                                }
                            }
                        }
                    }
                }
                Item { Layout.fillHeight: true }
            }
        }
    }

}





