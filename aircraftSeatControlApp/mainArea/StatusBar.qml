import QtQuick 2.12
import QtQuick.Controls 2.12

Rectangle {
    id: statusBar

    signal goBackPage()
    signal goNextPage()

    anchors {
        left: parent.left
        right: parent.right
        top: parent.top
    }
    color: "transparent"
    height: parent.height / 7

    Button {
        id: backButton
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        width: parent.height
        height: width
        onClicked: goBackPage()

        Image {
            anchors.fill: parent
            source: "qrc:/Images/previous.png"
            fillMode: Image.PreserveAspectFit
        }
    }

    Button {
        id: nextButton
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        width: parent.height
        height: width
        onClicked: goNextPage()

        Image {
            anchors.fill: parent
            source: "qrc:/Images/next.png"
            fillMode: Image.PreserveAspectFit
        }
    }
}
