import QtQuick 1.1
import com.nokia.meego 1.0
import QtMultimediaKit 1.1

Page {
    id: mainPage
    tools: tabBarTools

    Image {
        id: infoImage
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 10
        source: "images/1320925829_info.png"

        MouseArea {
            anchors.fill: parent
            onClicked: about.open()
        }
    }

    AboutDialog { id: about}

    TabGroup {
        id: tabs

        currentTab: page1

        RimshotPage {
            id: page1
            sound: "sounds/ba-da-dum.mp3"
            audio: audioPlayer

        }
        RimshotPage {
            id: page2
            sound: "sounds/laugh.mp3"
            audio: audioPlayer
        }
        RimshotPage {
            id: page3
            sound: "sounds/wah-wah.mp3"
            audio: audioPlayer
        }
        RimshotPage {
            id: page4
            sound: "sounds/boom-boom.mp3"
            audio: audioPlayer
        }
    }

    ToolBarLayout {
        id: tabBarTools
        visible: true
        ButtonRow {
            platformStyle: TabButtonStyle { }
            TabButton { tab: page1; text: "rimshot" }
            TabButton { tab: page2; text: "laugh" }
            TabButton { tab: page3; text: "wah wah" }
            TabButton { tab: page4; text: "two bits" }
        }
    }

    Audio {
        id: audioPlayer
    }


}
