import QtQuick 1.1
import com.nokia.meego 1.0


Page {
    tools: tabBarTools
    orientationLock: PageOrientation.LockPortrait

    TabGroup {
        id: tabs

        currentTab: page1

        RimshotPage {
            id: page1
            bgcolor: "white"
            audio: "sounds/37215__simon-lacelle__ba-da-dum.wav"
        }
        RimshotPage {
            id: page2
            bgcolor: "white"
            audio: "sounds/117479__mjwilson__michael-j-wilson-laugh.wav"
        }
        RimshotPage {
            id: page3
            bgcolor: "white"
            audio: "sounds/73750__timbre__benboncan-sad-trombone-more-wah-bright-de-clicked.wav"
        }
        RimshotPage {
            id: page4
            bgcolor: "white"
            audio: "sounds/44877__simondsouza__boom-boom.wav"
        }
    }


    ToolBarLayout {
        id: tabBarTools
        visible: true
        ButtonRow {
            platformStyle: TabButtonStyle { }
            TabButton { tab: page1; text: "ba-da-dum" }
            TabButton { tab: page2; text: "laugh" }
            TabButton { tab: page3; text: "trombone" }
            TabButton { tab: page4; text: "two bits" }
        }

    }


}
