import QtQuick 1.0
import com.nokia.meego 1.0

Sheet {
    id: settingsSheet

    acceptButtonText: "Ok"
    rejectButtonText: "Cancel"

    content:
        Column {
            id: col
            anchors.fill: parent
            anchors.margins: UIConstants.DefaultMargin


            Label {
                text: "Settings"
                platformStyle: LabelStyle {
                    fontFamily: UiConstants.HeaderFont
                    fontPixelSize: 32
                }
             }

            Rectangle {
                color: Qt.darker("white")
                height: 1
                anchors.left: parent.left
                anchors.right: parent.right

            }

            Row {
                anchors.left: parent.left
                anchors.right: parent.right
                spacing: width - swithcLabel.width - switchControl.width
                Label {id: swithcLabel; text: "Play on start"}
                Switch { id: switchControl; checked: false}
            }


    }



}
