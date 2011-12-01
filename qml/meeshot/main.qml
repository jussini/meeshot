import QtQuick 1.1
import com.nokia.meego 1.0

PageStackWindow {
    id: appWindow
    initialPage: mainPage

    // TODO: make readonly from c++
    // futureproofing, used to detect incompatible settings db
    property int dbapi: 1
    property bool playOnStart: false // by default don't play
    property int latestTab: 0 // by default select the first tab

    onLatestTabChanged: mainPage.currentTab = mainPage.indexToPageMap[""+latestTab]
    onPlayOnStartChanged:  console.log("playonstart changed")


    function loadSettings() {
        var db = openDatabaseSync("InstantMeeshotSettingsDB", "1.0", "Persistence storage for Instant Meeshot", 1000000);
        db.transaction(
                    function(tx) {
                        // Create the database if it doesn't already exist
                        tx.executeSql('CREATE TABLE IF NOT EXISTS Settings(dbapi INTEGER primary key, playOnStart INTEGER, latestTab INTEGER)');

                        // get the settings
                        var settings = tx.executeSql('SELECT * from Settings');
                        for (var i = 0; i < settings.rows.length; ++i) {
                            console.log("loading", settings.rows.item(i))
                            playOnStart = settings.rows.item(i).playOnStart;
                            latestTab = settings.rows.item(i).latestTab;
                        }
                    }
                    )
    }

    function saveSettings() {
        var db = openDatabaseSync("InstantMeeshotSettingsDB", "1.0", "Persistence storage for Instant Meeshot", 1000000);
        db.transaction(
                    function(tx) {
                        // Create the database if it doesn't already exist
                        tx.executeSql('CREATE TABLE IF NOT EXISTS Settings(dbapi INTEGER primary key, playOnStart INTEGER, latestTab INTEGER)');

                        tx.executeSql('INSERT OR REPLACE INTO Settings VALUES(?, ?, ?)', [ dbapi, playOnStart, latestTab ]);
                    }
                    )


    }

    Component.onCompleted: {
        theme.inverted = true;
        loadSettings();
    }

    Component.onDestruction: {
        saveSettings();
    }

    MainPage {
        id: mainPage
    }

    SettingsSheet {
        id: settingsSheet
        checked: playOnStart
        onAccepted: playOnStart = checked

    }

    Connections {
        target: Qt.application
        onActiveChanged: {
            console.log("active changed", Qt.application.active)
            if (Qt.application.active == true) {
                loadSettings()
                if (playOnStart == true) {
                    mainPage.currentTab.play()
                }

            } else {
                saveSettings()
            }
        }
    }

}
