import QtQuick 2.12

Rectangle {
    width: 300
    height: 300
    color: "transparent"
    border.color: "black"
    border.width: 3
    //anchors.top: footrestSlider.bottom
    anchors.topMargin: 50

    property real footrestVal: 0
    property real backSupportVal: 0
    property real headrestVal: 0


    onFootrestValChanged: {
        footrest.rotation = footrestVal
    }

    onBackSupportValChanged: {
        backSupport.rotation = backSupportVal
    }

    onHeadrestValChanged: {
        headrest.rotation = headrestVal
    }

    Rectangle{
        id: backSupport
        width: 10
        height: 150
        color: "lightgreen"
        anchors.top: parent.top
        anchors.topMargin: 30
        anchors.horizontalCenter: parent.horizontalCenter
        rotation: backSupportVal
    }

    Rectangle {
        id: headrest
        width: 10
        height: 50
        color: "yellow"
        anchors.top: backSupport.top
        anchors.right: backSupport.left
        rotation: headrestVal
    }

    Rectangle {
        id: backrest
        width: 100
        height: 10
        color: "lightgreen"
        anchors.top: backSupport.bottom
        anchors.right: backSupport.right
    }

    Rectangle {
        id: footrest
        width: 10
        height: 50
        color: "blue"
        anchors.top: backrest.bottom
        anchors.left:  backrest.left
        rotation: footrestVal
    }

}
