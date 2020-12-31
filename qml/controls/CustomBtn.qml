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
        radius: 10
    }
    contentItem: Item {
        id: item1
        Text {
            id: btnText
            width: 72
            height: 16
            text: btnCustom.text
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Courier"
            anchors.horizontalCenter: parent.horizontalCenter

            color: "#ffffff"
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:1.75;height:40;width:200}
}
##^##*/

