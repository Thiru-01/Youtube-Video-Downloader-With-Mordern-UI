import QtQuick 2.15
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15

RoundButton {
    id: btnMin
    y: 6

    implicitWidth: 25
    implicitHeight: 25
    property int wid: 25
    property int hei: 25
    property color colorDefault: "#FFBD44"
    property color mouseHover: "#F5F5F5"
    property color mouseclicked: "#AC87F4"
    QtObject {

        id: internal
        property var dynamicColor: if (btnMin.down) {
                                       btnMin.down ? mouseclicked : colorDefault
                                   } else {
                                       btnMin.hovered ? mouseHover : colorDefault
                                   }
    }
    palette.button: internal.dynamicColor
    width: wid
    height: hei
}
