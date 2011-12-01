import QtQuick 1.1
import com.nokia.meego 1.0
import QtMultimediaKit 1.1

Page {
    id: mainPage
    tools: tabBarTools

    property variant indexToPageMap: {"1":page1, "2":page2, "3":page3, "4":page4}
    property alias currentTab: tabs.currentTab

    AboutDialog { id: about}

    TabGroup {
        id: tabs

        currentTab: page1

        onCurrentTabChanged: latestTab = currentTab.index

        RimshotPage {
            id: page1
            index:1
            sound: "sounds/ba-da-dum.mp3"
            audio: audioPlayer

        }
        RimshotPage {
            id: page2
            index: 2
            sound: "sounds/laugh.mp3"
            audio: audioPlayer
        }
        RimshotPage {
            id: page3
            index: 3
            sound: "sounds/wah-wah.mp3"
            audio: audioPlayer
        }
        RimshotPage {
            id: page4
            index: 4
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

    ToolIcon {
        iconId: "toolbar-view-menu";
        onClicked: (mainMenu.status == DialogStatus.Closed) ?
                       mainMenu.open() : mainMenu.close()
        anchors.top: parent.top
        anchors.right: parent.right
    }

    // define the menu
         Menu {
             id: mainMenu
             // define the items in the menu and corresponding actions
             content: MenuLayout {
                 MenuItem {
                     text: "Settings"
                     onClicked: {
                         settingsSheet.checked = playOnStart
                         settingsSheet.open()
                     }
                 }
                 MenuItem {
                     text: "About"
                     onClicked: about.open()
                 }
                 MenuItem {
                     text: "Quit"
                     onClicked: Qt.quit()
                 }
             }
         }

    Audio {
        id: audioPlayer
    }


}
