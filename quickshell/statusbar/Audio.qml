pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import qs
import qs.services
import qs.common
Rectangle {
    id: root
    property string fgColor: Color.palette.primary
    implicitWidth: volIcon.implicitWidth + vol.implicitWidth
    implicitHeight: row.implicitHeight
    color: "transparent"

    // Component.onCompleted: {
    //     console.log("width of audio indicator: " + root.implicitWidth)
    //     console.log("volIcon implicitWidth: " + volIcon.implicitWidth)
    //     console.log("vol implicitWidth: " + vol.implicitWidth)
    //     console.log("row implicitWidth: " + row.implicitWidth)
    // }
    RowLayout {
        id: row
        anchors.fill: parent
        spacing: 4

        MaterialIcon {
            id: volIcon
            text: AudioService.getAudioIcon()
            size: 28
            Layout.alignment: Qt.AlignCenter
            color: root.fgColor
        }

        Text {
            font.pixelSize: 12
            id: vol
            text: `${AudioService.volume}`
            color: root.fgColor
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
        }
    }
}
