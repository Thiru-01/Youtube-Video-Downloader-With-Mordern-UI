import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Rectangle {
    id: bg
    width: 300
    height: 40
    radius: 15
    implicitWidth: 300
    implicitHeight: 40
    color: internal.dynamicColor
    property color colorDefault: "#282c34"
    property color colorOnFocus: "#282c34"
    property color colorMouseover: "#282c34"
    property alias link: textfield.text
    TextField {
        id: textfield
        y: 0
        height: 40

        QtObject {
            id: internal
            property var dynamicColor: if (textfield.focus) {
                                           textfield.hovered ? colorOnFocus : colorDefault
                                       } else {
                                           textfield.hovered ? colorMouseover : colorDefault
                                       }
        }

        implicitWidth: 300
        implicitHeight: 40
        placeholderText: qsTr("Enter the Url")
        color: "#ffffff"
        anchors.left: parent.left
        anchors.right: parent.right
        font.styleName: "Bold"
        font.weight: Font.Bold
        font.bold: true
        font.family: "Courier"
        anchors.rightMargin: 0
        anchors.leftMargin: 34
        background: Rectangle {

            color: internal.dynamicColor
            radius: 15
        }
        selectByMouse: true
        selectedTextColor: "#FFFFFF"
        selectionColor: "#ff007f"
        placeholderTextColor: "#81848c"
    }

    Image {
        id: image
        x: 0
        y: 0
        anchors.left: parent.left
        anchors.right: textfield.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: "../../images/svg/search.svg"
        anchors.topMargin: 4
        anchors.bottomMargin: 4
        anchors.leftMargin: 13
        anchors.rightMargin: -10
        fillMode: Image.PreserveAspectFit
    }
}
