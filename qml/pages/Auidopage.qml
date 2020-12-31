import QtQuick 2.15
import QtMultimedia 5.15
import QtQuick.Controls 2.15
import "../controls"
import QtQuick.Layouts 1.11
import Qt.labs.folderlistmodel 2.2
import QtQuick.Window 2.2

Item {
    id: videoPage
    Audio {
        id: playMusic
    }

    VideoOutput {
        anchors.verticalCenterOffset: -50
        autoOrientation: true
        anchors.rightMargin: 0
        anchors.leftMargin: 0
    }

    GridLayout {
        id: gridLayout
        x: 24
        y: 565
        width: 493
        height: 100
        PlayableButtons {
            id: playBtn
            x: 230
            y: 304
            width: 80
            height: 80
            Layout.minimumHeight: 50
            Layout.maximumHeight: 100
            Layout.minimumWidth: 50
            colorDefault: "#6822f2"
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            Layout.maximumWidth: 100
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
            Layout.minimumHeight: 50
            Layout.maximumHeight: 100
            Layout.minimumWidth: 50
            iconPath: "../../images/svg/pause.svg"
            colorDefault: "#6822f2"
            Layout.maximumWidth: 100
            mouseHover: "#f74574"
            onClicked: {
                playMusic.pause()
            }
        }
        columns: 2
        rows: 1
    }

    ListView {
        id: listView
        x: 0
        y: 702
        width: 540
        height: 200
        model: FolderListModel {
            id: folderModel
            folder: "../../Audio/"
            nameFilters: ["*.mp3"]
        }
        delegate: CustomBtnList {
            id: btns
            width: 540
            height: 50
            text: fileName
            font.family: "Tahoma"
            colorPressed: "#4b4582"
            font.hintingPreference: Font.PreferDefaultHinting
            colorDefault: "#221f3a"
            colorHover: "#ff4677"
            onClicked: {
                playMusic.source = fileUrl
                playMusic.play()
            }
        }
        flickableDirection: Flickable.AutoFlickIfNeeded
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:910;width:540}
}
##^##*/

