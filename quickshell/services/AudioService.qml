pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Services.Pipewire

Singleton {
    id: root

    PwObjectTracker {
        objects: [ Pipewire.defaultAudioSink ]
    }

    readonly property bool isReady: Pipewire.defaultAudioSink != null ? true : false
    readonly property bool isMuted: isReady ? Pipewire.defaultAudioSink?.audio.muted : false
    readonly property var volume: isReady ? Math.floor(Pipewire.defaultAudioSink?.audio.volume * 100) : null

    onIsReadyChanged: function () {
        return isReady
    }

    function getAudioIcon(): string {
        if (root.isReady) {
            if (root.isMuted) {
                return "volume_off"
            }
            if (root.volume != null) {
                if (root.volume >= 101) {
                    return "sound_detection_loud_sound";
                }
                if (root.volume >= 67) {
                    return "volume_up"
                }
                if (root.volume >= 34) {
                    return "volume_down"
                }
                if (root.volume >= 1) {
                    return "volume_mute"
                }
                if (root.volume == 0) {
                    return "no_sound"
                }
            } else {
                return "volume_off"
            }
        } else {
            return "no_sound"
        }
        return "no_sound"
    }
}
