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
            anchors.fill: parent
            anchors.margins: 22
            spacing: 10
            Row {
                spacing: 10
                Label { text: "Weather"; color: textSecondary; font.pixelSize: 16 }
            }
            Row {
                spacing: 16
                // Sun icon
                Canvas {
                    width: 60; height: 60
                    onPaint: {
                        var ctx = getContext("2d")
                        ctx.reset()
                        ctx.strokeStyle = "#ffd86b"; ctx.lineWidth = 3
                        ctx.beginPath(); ctx.arc(30,30,14,0,Math.PI*2); ctx.stroke()
                        for (var i=0;i<12;i++){
                            var a = i*Math.PI/6
                            var x1 = 30+Math.cos(a)*22
                            var y1 = 30+Math.sin(a)*22
                            var x2 = 30+Math.cos(a)*28
                            var y2 = 30+Math.sin(a)*28
                            ctx.beginPath(); ctx.moveTo(x1,y1); ctx.lineTo(x2,y2); ctx.stroke()
                        }
                    }
                }
                Column {
                    spacing: -6
                    Label { text: "Irvine"; color: textSecondary; font.pixelSize: 18 }
                    Row {
                        spacing: 4
                        Label { text: "68"; color: textPrimary; font.pixelSize: 64; font.bold: true }
                        Label { text: "°"; color: textPrimary; font.pixelSize: 54; anchors.baseline: prev.baseline; }
                    }
                    Label { id: prev; text: "H 76°  L 52°"; color: textSecondary; font.pixelSize: 16 }
                }
                Item { Layout.fillWidth: true }
                Column {
                    spacing: 4
                    Label { text: "Mostly Sunny"; color: textSecondary; font.pixelSize: 18; horizontalAlignment: Text.AlignRight; width: 160 }
                }
            }
            Rectangle { height: 1; color: "#223051"; width: parent.width }
            Row {
                spacing: 24
                anchors.margins: 6
                Repeater {
                    model: ["Now","10AM","11AM","12AM","1PM","2PM"]
                    delegate: Column {
                        spacing: 8
                        Label { text: modelData; color: textSecondary; font.pixelSize: 12; horizontalAlignment: Text.AlignHCenter }
                        Canvas {
                            width: 26; height: 26
                            onPaint: { var c=getContext("2d"); c.reset(); c.strokeStyle="#ffd86b"; c.lineWidth=2; c.beginPath(); c.arc(13,13,7,0,Math.PI*2); c.stroke() }
                        }
                    }
                }
            }
        }
    }
