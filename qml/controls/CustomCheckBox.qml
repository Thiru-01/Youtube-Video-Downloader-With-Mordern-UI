import QtQuick 2.12
import QtQuick.Controls 2.12

CheckBox {
    property color innerBox: "#01d6c0"
    property color outterBorder: "#282c34"
    id: control
    text: qsTr("CheckBox")
    checked: true
    implicitHeight: 60
    implicitWidth: 100

    indicator: Rectangle {
        implicitWidth: 26
        implicitHeight: 26
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        radius: 3
        border.color: outterBorder
        border.width: 3

        Rectangle {
            width: 14
            height: 14
            x: 6
            y: 6
            radius: 2
            visible: control.checked
            color: innerBox
        }
    }

    contentItem: Text {
        text: control.text
        font: control.font
        color: "#a09cac"
        verticalAlignment: Text.AlignVCenter
        leftPadding: control.indicator.width + control.spacing
    }
}
