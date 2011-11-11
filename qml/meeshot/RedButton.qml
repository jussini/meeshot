import QtQuick 1.0

Item {
    width: 210
    height: 210

    property color brighter: "#ed0000"
    property color darker: "#c20000"

    states: State {
        name: "pressed"
        PropertyChanges {
            target: lower
            color: brighter
        }
        PropertyChanges {
            target: upper
            color: darker
        }
    }

    Image {
        anchors.centerIn: parent
        source: "images/smaller-red-button-md.png"
    }

    Rectangle {
        visible: false
        id: lower
        width: 200
        height: 200
        anchors.horizontalCenter: parent.horizontalCenter
        y: upper.y + 8
        radius: width / 2
        color: darker
        smooth: true
    }

    Rectangle {
        visible: false
        id: upper
        width: 200
        height: 200
        anchors.centerIn: parent
        radius: width / 2
        color: brighter
        smooth: true
    }

}
