import QtQuick 2.12
import QtQuick.Controls 2.12

ApplicationWindow {
    visible: true
    width: 450
    height: 800
    title: "Airplane Seat Control"

    // Background Image
    Image {
        id: bgImage
        anchors.fill: parent
        source: "qrc:/Images/bgInage.jpg"
        opacity: 0.3
        fillMode:Image.PreserveAspectCrop
        z: -1 // Ensure the background image is behind other items
    }

    MainArea{
        id: mainArea
        anchors{
            top: parent.top
            bottom: bottomBar.top
        }
    }

    BottomBar{
        id: bottomBar
    }
}
