import QtQuick 2.0
import QtQuick.Controls 2.12

Rectangle{
    id: mainAria
    width: parent.width
    anchors{
        top: parent.top
        bottom: bottomBar.top
        right: parent.right
        left: parent.left
    }
    color: "transparent"

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: mainView
    }

    Component {
        id: mainView
        Item {
            Rectangle {
                id: setSeatControl
                width: 350
                height: 60
                color: "#7aa1f5"
                border.color: "lightgray"
                border.width: 2
                radius: 10
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter

                Text {
                    anchors.centerIn: parent
                    text: "Seat Adjustment Configuration"
                    font.pixelSize: 20
                    font.weight: Font.Light
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: stackView.push(seatControlPage)
                }
            }

            Rectangle {
                id: loadSeatControl
                width: 350
                height: 60
                color: "#7aa1f5"
                border.color: "lightgray"
                border.width: 2
                radius: 10
                anchors.top: setSeatControl.bottom
                anchors.topMargin: 30
                anchors.horizontalCenter: parent.horizontalCenter

                Text {
                    anchors.centerIn: parent
                    text:  "Saved Seat Adjustment Configuration"
                    font.pixelSize: 20
                    font.weight: Font.Light
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        SeatControlModel.loadDataFromjson()
                        stackView.push(seatControlPage)
                    }
                }
            }
        }
    }

    Component {
        id: seatControlPage
        SeatControl {
        }
    }
}

