import QtQuick 1.1
import com.nokia.meego 1.0

PageStackWindow {
    id: appWindow
    initialPage: mainPage

    Component.onCompleted: theme.inverted = true

    MainPage {
        id: mainPage
    }

    SettingsSheet {
        id: settingsSheet
    }

    Connections {
        target: Qt.application
        onActiveChanged: console.log("active changed", Qt.application.active)
    }

}
