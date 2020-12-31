import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.3
import "../controls"
import QtQuick.Layouts 1.11

Rectangle {
    id: downloadPage
    width: 530
    height: 910
    color: "#221f3a"
    GridLayout {
        id: videoGrid
        y: 59
        height: 44
        anchors.left: parent.left
        anchors.right: parent.right
        rows: 1
        columns: 2
        anchors.leftMargin: 22
        anchors.rightMargin: 8

        Textfield {
            id: videoText
            Layout.fillWidth: true
        }

        CustomBtn {

            text: qsTr("Open")
            Layout.preferredHeight: 40
            Layout.preferredWidth: 100
            Layout.rightMargin: 0
            Layout.leftMargin: 0
            colorPressed: "#4b4582"
            colorHover: "#282c34"
            colorDefault: "#ff4677"
            Layout.minimumHeight: 0
            Layout.minimumWidth: 0
            Layout.fillWidth: false

            onPressed: {
                videofile.open()
            }

            FileDialog {
                id: videofile

                title: "Please choose a file"
                folder: "../../Video"
                selectMultiple: false
                nameFilters: ["Mp4 File (*.mp4)", "Webm file (*.webm)"]
                onAccepted: {
                    videoText.link = videofile.fileUrl
                }
            }
        }
    }

    GridLayout {
        id: audioGrid
        y: 230
        height: 44
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.rightMargin: 15
        rows: 1
        columns: 2
        anchors.leftMargin: 15
        Textfield {
            id: mp3text
            displayn: "Path to Audio"
            Layout.fillWidth: true
        }

        CustomBtn {
            text: qsTr("Open")
            Layout.preferredHeight: 40
            Layout.preferredWidth: 100
            colorDefault: "#ff4677"
            colorHover: "#282c34"
            colorPressed: "#4b4582"
            Layout.minimumHeight: 0

            onClicked: {
                audiofile.open()
            }

            FileDialog {
                id: audiofile
                selectMultiple: false
                title: "Please choose a file"
                folder: "../../Audio"
                nameFilters: ["Mp4 File(*.mp4)","Mp3 File(*.mp3)"]
                onAccepted: {
                    mp3text.link = audiofile.fileUrl
                }
            }
        }
    }
    Connections {
        target: backend
        function onReturnState(state) {
            if (state) {
                indicatorGrid.visible = false
            }
        }
    }

    GridLayout {
        id: convertGrid
        x: 124
        y: 433
        width: 189
        height: 42
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 200
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter

        CustomBtn {
            id: convertBtn
            text: qsTr("Convert")

            Layout.minimumHeight: 0
            colorPressed: "#4b4582"
            colorHover: "#282c34"
            Layout.preferredHeight: 40
            colorDefault: "#01d6c0"
            Layout.preferredWidth: 150
            onClicked: {
                indicatorGrid.visible = true
                backend.mergeFiles(videofile.fileUrl, audiofile.fileUrl)
            }
        }
    }

    GridLayout {
        id: indicatorGrid
        x: 187
        y: 200
        width: 70
        height: 70
        visible: false
        anchors.verticalCenter: parent.verticalCenter
        BusyIndicator {
            id: busyIndicator
            visible: true
            Layout.fillWidth: true
            Layout.minimumWidth: 0
            palette.dark: "#ff4677"
            Layout.maximumWidth: 65535
            Layout.fillHeight: true
        }
        anchors.horizontalCenter: parent.horizontalCenter
        rowSpacing: 0
        anchors.horizontalCenterOffset: -30
        columnSpacing: 0
        rows: 1
        anchors.verticalCenterOffset: 0
        columns: 1
    }
}
