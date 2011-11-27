import QtQuick 1.0
import com.nokia.meego 1.0


Page {
    id: tabPage
    property color bgcolor: "transparent"
    property string sound: ""
    property QtObject audio
    property int index: -1

    Rectangle {
        anchors.fill: parent
        color: bgcolor
    }

    RedButton {
        id: button
        anchors.centerIn: parent
        state: mouse.pressed ? "pressed" : ""

        MouseArea {
            id: mouse
            anchors.fill: parent

            onClicked: {
                if (audio.playing) {
                    audio.stop()
                }
                audio.source = ""
                audio.source = tabPage.sound
                audio.play()
            }

        }
    }

}
