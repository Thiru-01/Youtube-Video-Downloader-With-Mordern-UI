import QtQuick 2.15
import QtMultimedia 5.15
import QtQuick.Controls 2.15
import "../controls"
import QtQuick.Layouts 1.11
import Qt.labs.folderlistmodel 2.2
import QtQuick.Window 2.2

Item {

    id: videoPage
    MediaPlayer {
        id: playMusic
    }
    VideoOutput {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.right: parent.right
        source: playMusic
        autoOrientation: true
        anchors.verticalCenterOffset: -50
        anchors.rightMargin: 0
        anchors.leftMargin: 0
    }

    GridLayout {
        id: gridLayout
        x: 24
        y: 565
        width: 493
        height: 100
        rows: 1
        columns: 2
        PlayableButtons {
            id: playBtn
            x: 230
            y: 304
            width: 80
            height: 80
            Layout.minimumHeight: 50
            Layout.minimumWidth: 50
            Layout.maximumHeight: 100
            Layout.maximumWidth: 100
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            colorDefault: "#6822f2"
            mouseHover: "#f74574"

            onClicked: {
                playMusic.play()
            }
        }
        PlayableButtons {
            id: pauseBtn
            x: 230
            y: 304
            width: 80
            height: 80
            iconPath: "../../images/svg/pause.svg"
            Layout.minimumHeight: 50
            Layout.minimumWidth: 50
            Layout.maximumHeight: 100
            Layout.maximumWidth: 100
            colorDefault: "#6822f2"
            mouseHover: "#f74574"

            onClicked: {
                playMusic.pause()
            }
        }
    }
    ListView {
        id: listView
        x: 0
        y: 702
        width: 540
        height: 200
        visible: false
        clip: true
        flickableDirection: Flickable.AutoFlickIfNeeded

        model: FolderListModel {
            id: folderModel
            showDirs: false
        }
        delegate: CustomBtnList {
            id: btns
            text: fileName
            colorPressed: "#4b4582"
            colorHover: "#ff4677"
            colorDefault: "#221f3a"
            font.hintingPreference: Font.PreferDefaultHinting
            font.family: "Tahoma"
            height: 50
            width: videoPage.width
            onClicked: {
                playMusic.source = fileUrl
                playMusic.play()
            }
        }
    }

    GridLayout {
        id: videoGrid
        height: 55
        opacity: 1
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 167
        anchors.rightMargin: 167
        anchors.verticalCenterOffset: -337
        rowSpacing: 0

        CustomCheckBox {
            id: mp4
            width: 100
            height: 0
            text: "Mp4"
            checked: false
            Layout.minimumHeight: 0
            font.family: "Courier"
            Layout.minimumWidth: 100
            Layout.fillHeight: false
            tristate: false
            innerBox: "#ff4677"
            Layout.fillWidth: false
            onClicked: {
                if (listView.visible == false) {
                    listView.visible = true
                }

                webm.checked = false
                folderModel.folder = "../../Video/Mp4/"
                folderModel.nameFilters = ["*.mp4"]
            }
        }

        CustomCheckBox {
            id: webm
            width: 100
            height: 0
            text: "Webm"
            tristate: false
            Layout.minimumHeight: 0
            font.family: "Courier"
            Layout.minimumWidth: 100
            Layout.fillHeight: false
            checked: false
            innerBox: "#ff4677"
            Layout.fillWidth: false
            onClicked: {
                if (listView.visible == false) {
                    listView.visible = true
                }
                mp4.checked = false
                folderModel.folder = "../../Video/Webm/"
                folderModel.nameFilters = ["*.webm"]
            }
        }
        columnSpacing: 0
        columns: 2
        rows: 1
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.8999999761581421;height:910;width:540}
}
##^##*/

