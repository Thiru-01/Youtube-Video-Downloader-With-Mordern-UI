import QtQuick 2.15
import "../controls"
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.15
import Qt.labs.animation 1.0

Rectangle {
    id: homepage
    color: "#221f3a"
    property bool indicatorVisiable: false
    GridLayout {

        id: gridLayout
        y: 127
        height: 50
        anchors.left: parent.left
        anchors.right: parent.right
        columnSpacing: 6
        rowSpacing: 0
        anchors.leftMargin: 27
        anchors.rightMargin: 27
        rows: 1
        columns: 2

        CustomTextfield {
            id: searchBar
            x: 87
            y: 77
            width: 258
            height: 40
            Layout.fillWidth: true
        }
        CustomBtn {
            id: searchBtn
            text: "Search"
            font.family: "Courier"
            Layout.maximumHeight: 65535
            Layout.maximumWidth: 160
            Layout.margins: 0
            Layout.fillHeight: false
            Layout.preferredWidth: -1
            colorPressed: "#4b4582"
            colorHover: "#282c34"
            colorDefault: "#01d6c0"
            Layout.fillWidth: true
            Layout.minimumHeight: 0
            Layout.minimumWidth: 160
            onClicked: {
                downloadProgr.value = 0
                cheboxAniReturn.running = true
                aComboXreturn.running = true
                xVideoAnmReturn.running = true
                dBtnXReturn.running = true
                indicatorVisiable = true
                backend.printLink(searchBar.link, indicatorVisiable)
            }
        }
    }

    Connections {
        target: backend
        function onIndicatorVisible(visibality) {
            indicatorVisiable = visibality
        }

        function onCheckBoxChange(stateOp) {
            if (stateOp) {
                audioCheck.checked = false
                videoCheck.checked = true
                aComboX.running = true
                dBtnX.running = true
                xVideoAnm.running = true
                cheboxAni.running = true
                backend.checkingDropBox(1, 1)
            } else {
                cheboxAniReturn.running = true
                xVideoAnmReturn.running = true
            }
        }

        function onModelList(modelList) {
            listCombobox.model = modelList
        }
        function onPrintPercent(percentage) {
            downloadProgr.text = percentage
            downloadProgr.value = percentage
        }
        function onReturnProgress(state) {
            if (state) {
                aComboX.running = true
                dBtnX.running = true
                xVideoAnm.running = true
                cheboxAni.running = true
                cancelBtnXReturn.running = true
                progressInReturn.running = true
            }
        }
    }

    GridLayout {

        id: indicatorGrid
        x: 187
        y: 200
        width: 70
        height: 70
        visible: indicatorVisiable
        anchors.verticalCenter: parent.verticalCenter
        columnSpacing: 0
        rowSpacing: 0
        anchors.horizontalCenterOffset: -30
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: -200
        rows: 1
        columns: 1

        BusyIndicator {
            id: busyIndicator
            visible: true
            Layout.fillWidth: true
            Layout.minimumWidth: 0
            Layout.maximumWidth: 65535
            Layout.fillHeight: true
            palette.dark: "#ff4677"
        }
    }

    GridLayout {

        id: checkBoxgrid

        width: 206
        height: 55
        opacity: 1
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenterOffset: -400
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        columnSpacing: 0
        rowSpacing: 0
        rows: 1
        columns: 2
        PropertyAnimation {
            id: cheboxAni
            target: checkBoxgrid
            property: 'anchors.horizontalCenterOffset'
            easing.bezierCurve: [0.00105, 0.745, 1, 1.01, 1, 1]
            to: -100
            duration: 500
            easing.type: Easing.InOutBounce
        }
        PropertyAnimation {
            id: cheboxAniReturn
            target: checkBoxgrid
            property: 'anchors.horizontalCenterOffset'
            easing.bezierCurve: [0, 0.00249, 1, 0.25, 1, 1]
            to: -400
            duration: 500
            easing.type: Easing.InOutBounce
        }

        CustomCheckBox {
            id: videoCheck
            width: 100
            height: 0
            text: "Video"
            checked: true
            checkable: true
            font.family: "Courier"

            Layout.minimumHeight: 0
            Layout.minimumWidth: 100
            Layout.fillHeight: false
            Layout.fillWidth: false
            onClicked: {
                backend.checkingDropBox(1, 1)

                audioCheck.checked = false
                xVideoAnm.running = true
            }
        }
        CustomCheckBox {
            id: audioCheck
            width: 100
            height: 0
            text: "Audio"
            checkable: true
            font.family: "Courier"
            checked: false
            Layout.minimumHeight: 0
            Layout.minimumWidth: 100
            Layout.fillWidth: false
            Layout.fillHeight: false
            onClicked: {
                xVideoAnmReturn.running = true
                videoCheck.checked = false
                backend.checkingDropBox(2, "None")
            }
        }
    }

    GridLayout {

        id: comboBoxGrid
        x: 550
        y: 493
        width: 294
        height: 46
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenterOffset: -435
        anchors.verticalCenterOffset: 129
        anchors.horizontalCenter: parent.horizontalCenter
        columnSpacing: 0
        rowSpacing: 0
        rows: 1
        columns: 1
        PropertyAnimation {
            id: aComboX
            target: comboBoxGrid
            property: 'anchors.horizontalCenterOffset'
            to: 0
            duration: 500
            easing.bezierCurve: [0.00105, 0.745, 1, 1.01, 1, 1]
            easing.type: Easing.OutInBounce
        }
        PropertyAnimation {
            id: aComboXreturn
            target: comboBoxGrid
            property: 'anchors.horizontalCenterOffset'
            to: -432
            duration: 500
            easing.bezierCurve: [0, 0.00249, 1, 0.25, 1, 1]
            easing.type: Easing.OutInBounce
        }
        CustomCombobox {
            id: listCombobox
            width: 294
            font.family: "Courier"
            flat: false
            Layout.bottomMargin: 2
            Layout.topMargin: 2
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }

    GridLayout {
        id: videoGrid
        width: 206
        height: 55
        opacity: 1
        anchors.verticalCenter: parent.verticalCenter
        rows: 1
        columnSpacing: 0
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 472
        columns: 2
        PropertyAnimation {
            id: xVideoAnm
            target: videoGrid
            property: "anchors.horizontalCenterOffset"
            easing.type: Easing.InOutBounce
            easing.bezierCurve: [0.00105, 0.745, 1, 1.01, 1, 1]
            duration: 500
            to: 100
        }

        PropertyAnimation {
            id: xVideoAnmReturn
            target: videoGrid
            property: "anchors.horizontalCenterOffset"
            easing.type: Easing.InOutBounce
            easing.bezierCurve: [0, 0.00249, 1, 0.25, 1, 1]
            duration: 500
            to: 472
        }

        CustomCheckBox {
            id: mp4
            width: 100
            height: 0
            text: "Mp4"
            font.family: "Courier"
            innerBox: "#ff4677"
            Layout.fillWidth: false
            Layout.minimumHeight: 0
            tristate: true
            Layout.minimumWidth: 100
            Layout.fillHeight: false
            onClicked: {
                webm.checked = false
            }
        }

        CustomCheckBox {
            id: webm
            width: 100
            height: 0
            text: "Webm"
            font.family: "Courier"
            innerBox: "#ff4677"
            Layout.fillWidth: false
            checked: false
            Layout.minimumHeight: 0
            Layout.minimumWidth: 100
            Layout.fillHeight: false
            onClicked: {
                mp4.checked = false
                backend.checkingDropBox(1, 2)
            }
        }
        anchors.horizontalCenter: parent.horizontalCenter
        rowSpacing: 0
    }

    GridLayout {
        id: dbtnGrid
        anchors.verticalCenter: parent.verticalCenter
        columnSpacing: 0
        rowSpacing: 0
        rows: 1
        columns: 1
        anchors.verticalCenterOffset: 264
        anchors.horizontalCenterOffset: 460
        anchors.horizontalCenter: parent.horizontalCenter

        PropertyAnimation {
            id: dBtnXReturn
            target: dbtnGrid
            property: "anchors.horizontalCenterOffset"
            easing.bezierCurve: [0, 0.00249, 1, 0.25, 1, 1]
            to: 460
            easing.type: Easing.InOutBounce
            duration: 500
        }

        PropertyAnimation {
            id: dBtnX
            target: dbtnGrid
            property: "anchors.horizontalCenterOffset"
            easing.bezierCurve: [0.00105, 0.745, 1, 1.01, 1, 1]
            to: 0
            easing.type: Easing.InOutBounce
            duration: 500
        }

        CustomBtn {
            id: downloadBtn
            text: "Download"

            font.family: "Courier"
            Layout.maximumHeight: 65535
            Layout.fillWidth: true
            Layout.margins: 0
            Layout.minimumHeight: 0
            colorHover: "#282c34"
            Layout.maximumWidth: 65535
            colorDefault: "#ff4677"
            Layout.preferredWidth: -1
            Layout.minimumWidth: 0
            Layout.fillHeight: true
            colorPressed: "#4b4582"
            onClicked: {

                downloadProgr.value = 0
                cheboxAniReturn.running = true
                aComboXreturn.running = true
                xVideoAnmReturn.running = true
                progressIn.running = true
                cancelBtnX1.running = true
                if (audioCheck.checkState) {

                    backend.startDownload(listCombobox.currentValue,
                                          "Audio", "None")
                }

                if (videoCheck.checkState) {

                    if (mp4.checkState) {

                        backend.startDownload(listCombobox.currentValue,
                                              "Video", "Mp4")
                    } else if (webm.checkState) {
                        backend.startDownload(listCombobox.currentValue,
                                              "Video", "Webm")
                    }
                }
            }
        }
    }

    GridLayout {
        id: progressGrid
        x: 172
        y: 400
        width: 158
        height: 152
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 460
        rows: 1
        columns: 1
        anchors.horizontalCenter: parent.horizontalCenter

        ProgrssBar {
            id: downloadProgr
            value: 0
            progressColor: "#ff4677"
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        PropertyAnimation {
            id: progressIn
            target: progressGrid
            property: "anchors.horizontalCenterOffset"
            easing.type: Easing.InOutBounce
            easing.bezierCurve: [0.00105, 0.745, 1, 1.01, 1, 1]
            duration: 500
            to: 0
        }

        PropertyAnimation {
            id: progressInReturn
            target: progressGrid
            property: "anchors.horizontalCenterOffset"
            easing.type: Easing.InOutBounce
            easing.bezierCurve: [0, 0.00249, 1, 0.25, 1, 1]
            duration: 500
            to: 460
        }
    }

    GridLayout {
        id: cancelGrid
        anchors.verticalCenter: parent.verticalCenter
        rowSpacing: 0
        rows: 1
        anchors.horizontalCenter: parent.horizontalCenter
        columns: 1
        columnSpacing: 0
        anchors.verticalCenterOffset: 264
        anchors.horizontalCenterOffset: -415
        PropertyAnimation {
            id: cancelBtnXReturn
            target: cancelGrid
            property: "anchors.horizontalCenterOffset"
            easing.bezierCurve: [0, 0.00249, 1, 0.25, 1, 1]
            easing.type: Easing.OutInBounce
            duration: 500
            to: -415
        }

        PropertyAnimation {
            id: cancelBtnX1
            target: cancelGrid
            property: "anchors.horizontalCenterOffset"
            easing.bezierCurve: [0.00105, 0.745, 1, 1.01, 1, 1]
            easing.type: Easing.OutInBounce
            duration: 500
            to: 0
        }

        CustomBtn {
            id: downloadBtn1
            text: "Cancel"
            Layout.fillHeight: true
            Layout.maximumHeight: 65535
            Layout.minimumHeight: 0
            font.family: "Courier"
            Layout.fillWidth: true
            Layout.margins: 0
            Layout.maximumWidth: 65535
            Layout.preferredWidth: -1
            Layout.minimumWidth: 0
            colorHover: "#282c34"
            colorPressed: "#4b4582"
            colorDefault: "#01d6c0"
            onClicked: {
                backend.close(true)
            }
        }
    }
}



