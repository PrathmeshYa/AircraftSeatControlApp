import QtQuick 2.12
import QtQuick.Controls 2.12

Item {
    id: adjustFootRest

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
            text: qsTr("Adjust FootRest from here: ")
        }
    }

    SliderFunctionality{
        id: footrestSlider
        anchors.top: hadderText.bottom
        anchors.topMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
        sliderVal: SeatControlModel.footRestValue
        sliderFrom: 0
        sliderTo: 100
        sliderStepSize: 10
        onSliderValChange:{
            SeatControlModel.footRestValue = value
            myChair.footrestVal = SeatControlModel.footRestValue
        }
    }

    MySeat{
        id: myChair
        anchors.top: footrestSlider.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
