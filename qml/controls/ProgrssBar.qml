import QtQuick 2.15
import QtGraphicalEffects 1.15
import QtQuick.Shapes 1.15

Item {
    id: progressbar
    implicitHeight: 250
    implicitWidth: 250

    property int qualitySamples: 12
    property bool roundCap: true
    property int startAngel: -90

    property color bgColor: "transparent"
    property color bgStrokeColor: "#27213D"
    property int srtokeBgWidth: 16
    property bool textShowValue: true

    property color progressColor: "#6822F2"
    property int progressWidth: 16

    property int maxValue: 100
    property int value: 50
    property string text: "%"
    property color textColor: "#ffffff"
    property int fontSize: 12
    property string fontFamily: "Segoe UI"

    Shape {
        id: shape
        anchors.fill: parent
        layer.enabled: true
        layer.samples: progressbar.qualitySamples

        ShapePath {
            id: pathBg
            strokeColor: progressbar.bgStrokeColor
            fillColor: progressbar.bgColor
            strokeWidth: progressbar.srtokeBgWidth
            capStyle: progressbar.roundCap ? ShapePath.RoundCap : ShapePath.FlatCap

            PathAngleArc {
                radiusX: (progressbar.width / 2) - (progressbar.progressWidth / 2)
                radiusY: (progressbar.height / 2) - (progressbar.progressWidth / 2)
                centerX: progressbar.width / 2
                centerY: progressbar.height / 2
                startAngle: progressbar.startAngel
                sweepAngle: 360
            }
        }
        ShapePath {
            id: path
            strokeColor: progressbar.progressColor
            fillColor: "transparent"
            strokeWidth: progressbar.progressWidth
            capStyle: progressbar.roundCap ? ShapePath.RoundCap : ShapePath.FlatCap

            PathAngleArc {
                radiusX: (progressbar.width / 2) - (progressbar.progressWidth / 2)
                radiusY: (progressbar.height / 2) - (progressbar.progressWidth / 2)
                centerX: progressbar.width / 2
                centerY: progressbar.height / 2
                startAngle: progressbar.startAngel
                sweepAngle: (360 / progressbar.maxValue * progressbar.value)
            }
        }
        Text {
            id: textProgrss
            width: 29
            height: 35
            text: progressbar.value + "%"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            color: progressbar.textColor
            font.pointSize: progressbar.fontSize
            font.family: progressbar.fontFamily
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.6600000262260437;height:250;width:250}
}
##^##*/

