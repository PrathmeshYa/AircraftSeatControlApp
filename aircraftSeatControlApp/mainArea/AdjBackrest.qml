import QtQuick 2.12
import QtQuick.Controls 2.12

Item {
    id: adjustBackRest

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
            text: qsTr("Adjust Seat Backrest ")
        }
    }

    SliderFunctionality{
        id: backrestSlider
        anchors.top: hadderText.bottom
        anchors.topMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
        sliderFrom: 0
        sliderTo: 100
        sliderStepSize: 10
        sliderVal: SeatControlModel.backRestValue
        onSliderValChange:{
            SeatControlModel.backRestValue = value
            myChair.backSupportVal = SeatControlModel.backRestValue
        }
    }

    MySeat{
        id: myChair
        anchors.top: backrestSlider.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
