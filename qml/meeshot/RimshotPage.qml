import QtQuick 1.0
import com.nokia.meego 1.0
import QtMultimediaKit 1.1

Page {
    id: tabPage
    property color bgcolor: "transparent"
    property string audio: ""

    Rectangle {
        anchors.fill: parent
        //opacity: tabPage.parent.currentTab == tabPage ? 0.2 : 0.0
        //Behavior on opacity { PropertyAnimation {}}
        color: bgcolor
    }

    Image {
        id: buttonImage
        source: "images/red_button.png"
        anchors.centerIn: parent
        width: 0.8* parent.width
        //width: 0.8* Math.min(parent.width, parent.height)
        height: 0.9*width

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (!sound.playing) {
                    console.log("starting")
                    sound.source = ""
                    sound.source = tabPage.audio
                    sound.position = 0
                    sound.play()
                } else {
                    console.log("already playing")
                    sound.stop()
                    sound.source = ""
                    sound.source = tabPage.audio
                    sound.position = 0
                    sound.play()
                }

            }
        }
    }

    Audio {
        id: sound
    }

}
