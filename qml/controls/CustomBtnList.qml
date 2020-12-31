import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: btnCustom
    property color colorDefault: "#8d8d8d"
    property color colorHover: "#f5f5f5"
    property color colorPressed: "#474747"
    property alias horizontalAlign: btnText.horizontalCenter
    property alias verticalAlign: btnText.verticalCenter

    text: "Download"
    display: AbstractButton.TextBesideIcon

    QtObject {
        id: internal
        property var dynamicColor: if (btnCustom.down) {
                                       btnCustom.down ? colorPressed : colorDefault
                                   } else {
                                       btnCustom.hovered ? colorHover : colorDefault
                                   }
    }

    implicitHeight: 40
    implicitWidth: 200
    background: Rectangle {
        color: internal.dynamicColor
    }
    contentItem: Item {
        id: item1
        Text {
            id: btnText
            anchors.fill: item1
            text: btnCustom.text
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 5
            font.family: "Courier"
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#ffffff"
            wrapMode: Text.WordWrap
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

