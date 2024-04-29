import QtQuick 2.0
import QtQuick.Controls 2.12

Item {

    signal sliderValChange(int value)

    property int sliderVal: 0
    property real sliderFrom: 0
    property real sliderTo: 10
    property real sliderStepSize: 1

    Rectangle {
        id: adjustFootRestslider
        anchors.horizontalCenter: parent.horizontalCenter
        color: "transparent"
        width: 430
        height: 50

        // Minus Button
        Rectangle {
            anchors.left: parent.left
            id: minusButton
            width: 50
            height: 50
            radius: width / 2
            Text {
                anchors.centerIn: parent
                color: "#7aa1f5"
                text: "-"
                font.pixelSize: 35
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    var newValue = mySlider.value - mySlider.stepSize
                    if (newValue >= mySlider.from) {
                        mySlider.value = newValue
                        sliderValChange(newValue)
                    }
                }
            }
        }

        Slider {
            id: mySlider
            anchors {
                left: minusButton.right
                right: plusButton.left
                verticalCenter: parent.verticalCenter
            }
            width: parent.width - minusButton.width - plusButton.width - 20
            from: sliderFrom
            to: sliderTo
            stepSize: sliderStepSize
            value: sliderVal
            orientation: Qt.Horizontal
            onValueChanged: {
                console.log("Slider value changed to:", value)
                sliderValChange(value)
            }
        }

        // Plus Button
        Rectangle {
            id: plusButton
            anchors.right: parent.right
            width: 50
            height: 50
            radius: width / 2
            Text {
                anchors.centerIn: parent
                color: "#7aa1f5"
                text: "+"
                font.pixelSize: 35
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    var newValue = mySlider.value + mySlider.stepSize
                    if (newValue <= mySlider.to) {
                        mySlider.value = newValue
                        sliderValChange(newValue)
                    }
                }
            }
        }
    }
}
