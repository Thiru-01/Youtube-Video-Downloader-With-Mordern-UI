import QtQuick 2.15
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15

RoundButton {
    id: btnPlay
    property int wid: 100
    property int hei: 100
    property color colorDefault: "#FFBD44"
    property color mouseHover: "#F5F5F5"
    property color mouseclicked: "#AC87F4"
    property color iconColor: "#fff"
    property url iconPath: "../../images/svg/play.svg"
    QtObject {

        id: internal
        property var dynamicColor: if (btnPlay.down) {
                                       btnPlay.down ? mouseclicked : colorDefault
                                   } else {
                                       btnPlay.hovered ? mouseHover : colorDefault
                                   }
    }
    palette.button: internal.dynamicColor
    height: hei
    width: wid
    contentItem: Item {
        id: iconBg
        anchors.fill: parent

        Image {
            id: icon
            source: iconPath
            fillMode: Image.PreserveAspectFit
            height: wid - 75
            width: hei - 75
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            sourceSize.height: 50
            sourceSize.width: 50

            ColorOverlay {
                anchors.fill: icon
                source: icon
                color: iconColor
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.3300000429153442}
}
##^##*/

