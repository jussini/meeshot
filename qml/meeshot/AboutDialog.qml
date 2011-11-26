import QtQuick 1.0
import com.nokia.meego 1.0

Dialog {
    id: myDialog
    title: Label {
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Instant Meeshot"
        platformStyle: LabelStyle {
            fontPixelSize: 30
        }
        anchors.bottomMargin: 10
    }

    content:Item {
        id: name
        height: 260
        width: parent.width

        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            Label {text: " "}
            Label {text: "Press the button for sound effects."}
            Label {text: "Change the effect from the bottom row."}
            Label {text: " "}
            Label {text: "Version 1.47.0"}
            Label {text: "Released under GPL v3 license"}
            Label {text: "Jussi Niskanen 2011"}
            Label {text: "http://ankkatalo.net/meeshot"}
        }

    }

    buttons: Button {
        text: "OK";
        onClicked: myDialog.accept();
        anchors.horizontalCenter: parent.horizontalCenter
    }

}
