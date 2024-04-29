import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Item {

    property string currentPage: "SeatControlMainPage"

    StatusBar{
        id:statusBar
        anchors{
            top: parent.top
        }
        onGoBackPage: stackView.pop()
        onGoNextPage: stackView.push()
    }

    RowLayout {
        id: seatControlMainPage
        anchors {
            top: statusBar.bottom
            topMargin: 20
            left: parent.left
            leftMargin: 15
            right: parent.right
        }
        spacing: 15

        // First Row
        ColumnLayout {
            spacing: 20
            Button {
                id: adjFootrest
                Layout.minimumWidth: 200
                Layout.minimumHeight: 200

                onClicked: stackView.push("qrc:/AdjFootrest.qml")

                Image {
                    anchors.fill: parent
                    source: "qrc:/Images/footrest.png"
                    fillMode: Image.PreserveAspectFit
                }
                Text {
                    id: textFootrest
                    text: qsTr("Adjust Footrest")
                    anchors.top: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Button {
                id: adjBackrest
                Layout.minimumWidth: 200
                Layout.minimumHeight: 200
                onClicked: {
                    onClicked: stackView.push("qrc:/AdjBackrest.qml")
                }

                Image {
                    anchors.fill: parent
                    source: "qrc:/Images/baskrest.png"
                    fillMode: Image.PreserveAspectFit
                }
                Text {
                    id: textBackrest
                    text: qsTr("Adjust Backrest")
                    anchors.top: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }

        // Second Row
        ColumnLayout {
            spacing: 20
            Button {
                id: adjHeadrest
                Layout.minimumWidth: 200
                Layout.minimumHeight: 200
                onClicked: {
                    onClicked: stackView.push("qrc:/AdjHeadrest.qml")
                }

                Image {
                    anchors.fill: parent
                    source: "qrc:/Images/Headrest.png"
                    fillMode: Image.PreserveAspectFit
                }
                Text {
                    id: textHeadrest
                    text: qsTr("Adjust Headrest")
                    anchors.top: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Button {
                id: adjHardness
                Layout.minimumWidth: 200
                Layout.minimumHeight: 200
                onClicked: {
                    onClicked: stackView.push("qrc:/AdjHardness.qml")
                }
                Image {
                    anchors.fill: parent
                    source: "qrc:/Images/Hardness.png"
                    fillMode: Image.PreserveAspectFit
                }
                Text {
                    id: textHardness
                    text: qsTr("Adjust Seat Hardness")
                    anchors.top: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }
    }

    RowLayout {
        id: saveAndrestControls
        anchors {
            top: seatControlMainPage.bottom
            topMargin: 30
//            horizontalCenter:  parent.horizontalCenter
//            left: parent.left
//            leftMargin: 15
//            right: parent.right
        }
        spacing: 15

        Rectangle {
            id: saveSeatData
            width: 200
            height: 60
            color: "#7aa1f5"
            border.color: "lightgray"
            border.width: 2
            radius: 10

            Text {
                anchors.centerIn: parent
                text: "Save Seat Position"
                font.pixelSize: 20
                font.weight: Font.Light
            }
            MouseArea {
                anchors.fill: parent

                onClicked:{
                    SeatControlModel.saveDataTojson()
                    stackView.pop("qrc:/SeatControl.qml")
                }
            }
        }

        Rectangle {
            id: resetSeatData
            width: 200
            height: 60
            color: "#7aa1f5"
            border.color: "lightgray"
            border.width: 2
            radius: 10

            Text {
                anchors.centerIn: parent
                text: "default Seat Position"
                font.pixelSize: 20
                font.weight: Font.Light
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    SeatControlModel.setToDefaultSeatPosition()
                }
            }
        }
    }
}
