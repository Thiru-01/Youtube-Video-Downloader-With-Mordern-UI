import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    id: leftBtn

    property url iconSource: "../../images/svg/homeBtn.svg"
    property color colorDefault: "#5E5778"
    property color mouseHover: "#F5F5F5"
    property color mouseclicked: "#AC87F4"
    property int iconwidth: 45
    property int leftAnchor: 15
    property int iconheigth: 45
    property color activeColor: "#FF4677"
    property color overlayColor: "#FF4677"
    property bool isactivebtn: false
    QtObject {
        id: internal
        property color dynamicColor: if (leftBtn.down) {
                                         leftBtn.down ? mouseclicked : colorDefault
                                     } else if (isactivebtn) {
                                         activeColor
                                     } else {
                                         leftBtn.hovered ? mouseHover : colorDefault
                                     }
    }

    implicitWidth: 60
    implicitHeight: 60
    background: Rectangle {
        id: bgBtn
        color: "#00000000"
        Rectangle {
            anchors {
                top: parent.top
                bottom: parent.bottom
                left: parent.left
            }
            color: activeColor
            width: 3
            visible: isactivebtn
        }
    }

    contentItem: Item {
        anchors.fill: parent
        id: content
        width: 60
        Image {
            id: btnIcon
            width: iconwidth
            height: iconheigth
            source: iconSource
            anchors.leftMargin: 15
            sourceSize.width: iconwidth
            sourceSize.height: iconheigth
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            fillMode: Image.PreserveAspectFit
        }
        ColorOverlay {
            anchors.fill: btnIcon
            source: btnIcon
            color: internal.dynamicColor
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right

            antialiasing: true
            width: iconwidth
            height: iconheigth
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:100;width:100}D{i:6}
}
##^##*/

