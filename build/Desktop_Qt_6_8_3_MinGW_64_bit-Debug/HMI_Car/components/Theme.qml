import QtQuick
pragma Singleton

QtObject {
    id: root

    readonly property color themeColor: {
        if (Backend.driveMode === 0) return "#00e3fd";
        if (Backend.driveMode === 1) return "#ff3f34";
        return "#a55eea"
    }

    readonly property color themeMuted: {
            if (Backend.driveMode === 0) return "#81ecff";
            if (Backend.driveMode === 1) return "#ff7675";
            return "#dfa6ff";
        }

    readonly property int padding: 32
    readonly property int borderRadius: 24
}
