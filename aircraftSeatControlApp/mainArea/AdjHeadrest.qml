import QtQuick 2.12
import QtQuick.Controls 2.12

Item {
    id: adjustHeadrest
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
            text: qsTr("Adjust Seat Headrest ")
        }
    }

    SliderFunctionality{
        id: headrestSlider
        anchors.top: hadderText.bottom
        anchors.topMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
        sliderVal: SeatControlModel.headrestValue
        sliderFrom: 0
        sliderTo: 100
        sliderStepSize: 10
        onSliderValChange:{
            SeatControlModel.headrestValue = value
            myChair.headrestVal = SeatControlModel.headrestValue
        }
    }

    MySeat{
        id: myChair
        anchors.top: headrestSlider.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
