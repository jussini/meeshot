import QtQuick 1.0
import com.nokia.meego 1.0

Sheet {
    id: settingsSheet

    property alias checked: switchControl.checked

    acceptButtonText: "Ok"
    rejectButtonText: "Cancel"

    content:
        Column {
            id: col
            anchors.fill: parent
            anchors.leftMargin: 16
            anchors.rightMargin: 16
            //anchors.margins: UIConstants.DefaultMargin

            // ugly fuck with these spacers...
            Item {height: 14; width: 1}
            Label {
                text: "Settings"
                font.weight: Font.Light
                platformStyle: LabelStyle {
                    fontFamily: UiConstants.HeaderFont
                    fontPixelSize: 32
                }
             }
            Item {height: 16; width: 1}
            /*
            Rectangle {
                color: Qt.darker("white")
                height: 1
                anchors.left: parent.left
                anchors.right: parent.right

            }
            */

            //Item {height: 10; width: 1}
            Row {
                anchors.left: parent.left
                anchors.right: parent.right
                spacing: width - swithcLabel.width - switchControl.width
                Label {
                    id: swithcLabel;
                    text: "Play on start"
                    font.weight: Font.Bold
                    platformStyle: LabelStyle {
                        fontFamily: UiConstants.TitleFont
                        fontPixelSize: 26

                    }
                }
                Switch { id: switchControl; checked: false}
            }


    }



}
