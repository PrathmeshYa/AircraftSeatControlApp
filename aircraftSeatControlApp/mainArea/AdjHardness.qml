import QtQuick 2.12
import QtQuick.Controls 2.12

Item {
    id: adjustHardness

    StatusBar{
        id:statusBar
        anchors{
            top: parent.top
        }
        onGoBackPage: stackView.pop()
    }

    Rectangle {
        id: hadderText
        anchors.top: statusBar.bottom
        anchors.topMargin: 50
        anchors.left: parent.left
        color: "#b3e6d1"
        Text {
            font.bold: true
            font.pixelSize: 25
            text: qsTr("Adjust Seat Hardness ")
        }
    }

    SliderFunctionality{
        id: seatHardnessSlider
        anchors.top: hadderText.bottom
        anchors.topMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
        sliderVal: SeatControlModel.seatHardnessValue
        onSliderValChange:{
            SeatControlModel.seatHardnessValue = value
        }
    }

    MySeat{
        id: myChair
        anchors.top: seatHardnessSlider.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
