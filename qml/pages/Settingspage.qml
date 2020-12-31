import QtQuick 2.0
import QtGraphicalEffects 1.0

Rectangle {
    id: settingPage
    color: "#221f3a"

    Rectangle {
        id: shadow
        y: 271
        height: 308
        color: "#00000000"
        radius: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        z: 1

        Rectangle {
            id: container
            color: "#1e1a33"
            radius: 10
            anchors.fill: parent
            anchors.rightMargin: 10
            anchors.leftMargin: 10
            anchors.bottomMargin: 10
            anchors.topMargin: 10

            Text {
                id: composeText
                text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'MS Shell Dlg 2'; font-size:7.8pt; font-weight:400; font-style:normal;\">\n<p align=\"center\" style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-family:'robotoBold';\"><br /></p>\n<p align=\"center\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'MS Shell Dlg 2','Roboto Medium','Franklin Gothic Demi Cond','Oswald SemiBold'; font-size:16pt; font-weight:600; color:#fee5ec;\">GNU GENERAL PUBLIC LICENSE</span></p>\n<p align=\"center\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'MS Shell Dlg 2','Franklin Gothic Demi Cond'; font-size:11pt; color:#7a7289;\">Version 1.0, 31 December 2020</span></p>\n<p align=\"center\" style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-family:'robotoBold'; color:#7a7289;\"><br /></p>\n<p align=\"center\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'MS Shell Dlg 2','Franklin Gothic Demi Cond'; font-size:14pt; color:#7a7289;\">Copyright (c) 2020</span><span style=\" font-family:'MS Shell Dlg 2','Franklin Gothic Demi Cond'; font-size:14pt; font-weight:600; color:#7a7289;\"> </span><span style=\" font-family:'MS Shell Dlg 2','Franklin Gothic Demi Cond'; font-size:14pt; font-weight:600; color:#fee5ec;\">Thirumurugan</span></p>\n<p align=\"center\" style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-family:'robotoBold'; color:#7a7289;\"><br /></p>\n<p align=\"center\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'robotoBold'; font-size:12pt; font-weight:600; color:#fee5ec;\">Attention</span><span style=\" font-family:'robotoBold'; font-size:12pt; color:#7a7289;\">:</span><span style=\" font-family:'robotoBold'; color:#7a7289;\"> </span><span style=\" font-family:'MS Shell Dlg 2','MS Gothic'; font-size:10pt; color:#7a7289;\">This project was created with the Open Source tools from </span><span style=\" font-family:'MS Shell Dlg 2','MS Gothic'; font-size:10pt; color:#716d8d;\">Qt Company</span><span style=\" font-family:'MS Shell Dlg 2','MS Gothic'; font-size:10pt; color:#7a7289;\">,</span></p>\n<p align=\"center\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'robotoBold'; font-size:10pt; color:#7a7289;\">                this project can be used for studies or personal non-commercial projects.</span></p>\n<p align=\"center\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'robotoBold'; font-size:10pt; color:#7a7289;\">If you are going tp use it for commercial use , you need to purchase a license at</span></p>\n<p align=\"center\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'robotoBold'; font-size:10pt; font-weight:600; color:#fee5ec;\"> </span><a name=\"https://www.qt.io\"></a><a href=\"https://www.qt.io\"><span style=\" font-family:'robotoBold'; font-size:10pt; font-weight:600; text-decoration: underline; color:#fee5ec;\">h</span></a><span style=\" font-family:'robotoBold'; font-size:10pt; font-weight:600; text-decoration: underline; color:#fee5ec;\">ttps://www.qt.io</span><span style=\" font-family:'robotoBold'; font-size:10pt; font-weight:600; color:#716d8d;\"> </span></p></body></html>"
                anchors.fill: parent
                font.pixelSize: 12
                minimumPointSize: 18
                minimumPixelSize: 18
                textFormat: Text.RichText
                wrapMode: Text.WordWrap
                font.styleName: "Regular"
                style: Text.Normal
                renderType: Text.NativeRendering
            }
        }
    }
    DropShadow {
        id: dropShadow
        color: "#80000000"
        radius: 15
        horizontalOffset: 0
        z: 0
        samples: 16
        verticalOffset: 0
        anchors.fill: shadow
        source: shadow
        spread: 0
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.6600000262260437;height:910;width:530}D{i:1}
}
##^##*/

