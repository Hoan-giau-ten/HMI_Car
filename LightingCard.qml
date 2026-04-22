import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import Qt5Compat.GraphicalEffects
import QtQuick.Shapes 1.15
        Item {
            width: 380; height: 300
            Loader { anchors.fill: parent; sourceComponent: Card }
            Column {
                anchors.fill: parent; anchors.margins: 22; spacing: 10
                Label { text: "Lighting"; color: textSecondary; font.pixelSize: 16 }
                Item { height: 8 }
                Item {
                    height: 140
                    anchors.horizontalCenter: parent.horizontalCenter
                    // bulb icon + glow
                    Canvas {
                        id: bulb
                        width: 100; height: 140
                        anchors.horizontalCenter: parent.horizontalCenter
                        onPaint: {
                            var ctx = getContext("2d"); ctx.reset();
                            ctx.strokeStyle = textPrimary; ctx.lineWidth=3
                            // bulb
                            ctx.beginPath(); ctx.moveTo(50,20); ctx.quadraticCurveTo(90,20,90,60); ctx.quadraticCurveTo(90,85,70,100); ctx.lineTo(30,100); ctx.quadraticCurveTo(10,85,10,60); ctx.quadraticCurveTo(10,20,50,20); ctx.stroke()
                            // screw
                            ctx.beginPath(); ctx.moveTo(30,100); ctx.lineTo(70,100); ctx.lineTo(70,112); ctx.lineTo(30,112); ctx.closePath(); ctx.stroke()
                            ctx.beginPath(); ctx.moveTo(30,112); ctx.lineTo(70,112); ctx.lineTo(70,122); ctx.lineTo(30,122); ctx.closePath(); ctx.stroke()
                        }
                    }
                }
                // slider line with snow/sun ends
                Row {
                    spacing: 12
                    Label { text: "\u2744"; color: textSecondary; font.pixelSize: 18 }
                    Slider {
                        id: lightSlider
                        from: 0; to: 100; value: 70
                        Layout.fillWidth: true
                        background: Rectangle { implicitHeight: 6; radius: 3; color: "#2b3550" }
                        handle: Rectangle { width: 22; height: 22; radius: 11; color: textPrimary; border.width: 0; y: (parent.availableHeight-height)/2 }
                    }
                    Label { text: "\u2730"; color: textSecondary; font.pixelSize: 18 }
                }
                Row { spacing: 8; anchors.horizontalCenter: parent.horizontalCenter
                    Label { text: "Bedroom 1"; color: textPrimary; font.pixelSize: 18 }
                    Rectangle { width: 22; height: 22; radius: 11; color: "#2b3550"; Text { anchors.centerIn: parent; text: "\u25B6"; color: textSecondary } }
                }
            }
        }
