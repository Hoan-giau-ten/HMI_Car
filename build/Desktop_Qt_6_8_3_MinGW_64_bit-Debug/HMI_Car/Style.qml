pragma Singleton
import QtQuick

QtObject {
    // Backgrounds
    readonly property color background: "#0d0e0f"
    readonly property color surfaceLow: "#121315"
    readonly property color surfaceContainer: "#191a1b"
    readonly property color surfaceHighest: "#252627"

    // Accents (Neon Blue)
    readonly property color primary: "#81ecff"
    readonly property color primaryFixed: "#00e3fd"

    // Text colors
    readonly property color onSurface: "#ffffff"
    readonly property color onSurfaceVariant: "#ababac"

    // Status colors
    readonly property color error: "#ff716c"
    readonly property color warning: "#ff9479"

    // Component styling
    readonly property int radiusXl: 16
    readonly property int radiusFull: 100
}
