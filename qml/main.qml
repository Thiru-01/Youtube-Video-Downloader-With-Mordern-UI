import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.15
import "controls"
import "pages"
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.11

Window {
    id: mainWindow
    width: 600
    height: 1000
    minimumHeight: 1000
    minimumWidth: 600
    visible: true
    property int windowStatus: 0
    property int marginValue: 10

    color: "#00000000"
    title: qsTr("Youtube Downloader")
    flags: Qt.Window | Qt.FramelessWindowHint

    QtObject {
        id: internal

        function changePageName(valueName) {
            topBarDesp.despr = valueName
        }
    }

    Rectangle {
        id: bg
        border.color: "#000000"
        border.width: 0
        anchors.fill: parent
        anchors.rightMargin: 5
        anchors.leftMargin: 5
        anchors.bottomMargin: 5
        anchors.topMargin: 5
        z: 1
        Rectangle {
            id: appContent
            color: "#00000000"
            border.color: "#2a2648"
            anchors.fill: parent
            anchors.topMargin: 0

            Rectangle {
                id: topBar
                height: 60
                color: "#221f3a"
                border.color: "#383552"
                border.width: 0
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.leftMargin: 0
                anchors.rightMargin: 0
                anchors.topMargin: 0

                Rectangle {
                    id: topBarDesp
                    color: "#221f3a"
                    anchors.fill: parent
                    anchors.leftMargin: 60
                    property alias despr: despRight.text

                    Label {
                        id: despleft
                        x: 0
                        y: 35
                        height: 25
                        text: qsTr("Label")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.bottom
                        anchors.bottom: parent.bottom
                        anchors.topMargin: 0
                        anchors.rightMargin: 150
                        anchors.leftMargin: 60
                        anchors.bottomMargin: 0
                    }
                    Label {
                        id: despRight
                        color: "#a09cac"
                        text: qsTr("|HOME")
                        anchors.left: parent.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                        anchors.bottomMargin: 0
                        anchors.topMargin: 35
                        anchors.rightMargin: 5
                        anchors.leftMargin: 0
                    }
                }

                Rectangle {
                    id: titleBar
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 25
                    anchors.topMargin: 0
                    anchors.leftMargin: 61
                    anchors.rightMargin: 137
                    DragHandler {
                        onActiveChanged: if (active) {
                                             mainWindow.startSystemMove()
                                         }
                    }

                    Label {
                        id: label1
                        color: "#a09cac"
                        text: qsTr("Youtube Downloader")
                        anchors.fill: parent
                        font.letterSpacing: 3
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 11
                        font.bold: true
                        font.family: "Arial"
                    }
                }

                Image {
                    id: image
                    anchors.left: parent.left
                    anchors.right: topBarDesp.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    source: "../images/svg/youtube icon.svg"
                    sourceSize.height: 50
                    sourceSize.width: 50
                    anchors.bottomMargin: 25
                    anchors.topMargin: 5
                    anchors.leftMargin: 15
                    anchors.rightMargin: 15
                    fillMode: Image.PreserveAspectFit
                    ColorOverlay {
                        anchors.fill: image
                        source: image
                        anchors.rightMargin: 0
                        anchors.bottomMargin: 0
                        anchors.leftMargin: 0
                        anchors.topMargin: 0
                        color: "#FF4677"
                        antialiasing: true
                    }
                }

                Rectangle {
                    id: topActiontab
                    y: 0
                    height: 35
                    color: "#00000000"
                    anchors.left: titleBar.right
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0

                    Rectangle {
                        id: rectangle1
                        width: 137
                        height: 35
                        color: "#00000000"
                        TopAction {
                            id: btnmin
                            x: 56
                            y: 0
                            width: 25
                            height: 25
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom
                            anchors.rightMargin: 90
                            mouseclicked: "#b57f27"
                            mouseHover: "#ffda9b"
                            anchors.topMargin: 5
                            anchors.bottomMargin: 5
                            padding: 10
                            hei: 35
                            wid: 35
                            onClicked: {
                                mainWindow.showMinimized()
                            }
                        }

                        TopAction {
                            id: btnclose
                            x: 2
                            y: 0
                            width: 25
                            height: 25
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom
                            mouseHover: "#ff9d9b"
                            mouseclicked: "#ff3a37"
                            colorDefault: "#ff605c"
                            wid: 35
                            anchors.topMargin: 5
                            anchors.rightMargin: 5
                            padding: 10
                            hei: 35
                            anchors.bottomMargin: 5
                            onClicked: mainWindow.close()
                        }
                    }
                }
            }

            Rectangle {
                id: content
                color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: topBar.bottom
                anchors.bottom: parent.bottom
                clip: false
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.rightMargin: 0
                anchors.topMargin: 0

                Rectangle {
                    id: leftMenu
                    width: 60
                    color: "#221f3a"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    clip: true
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0
                    anchors.leftMargin: 0

                    LeftBtns {
                        id: settingsBtn
                        y: 180
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        iconSource: "../images/svg/settings.svg"
                        anchors.rightMargin: 0
                        anchors.leftMargin: 0
                        anchors.bottomMargin: 0
                        iconheigth: 30
                        leftAnchor: 12
                        iconwidth: 30
                        onClicked: {
                            internal.changePageName("| SETTINGS")
                            homeBtn.isactivebtn = false
                            downBtn.isactivebtn = false
                            videoBtn.isactivebtn = false
                            audioBtn.isactivebtn = false
                            settingsBtn.isactivebtn = true
                            stacklay.currentIndex = 4
                        }
                    }

                    Column {
                        id: column
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        clip: false
                        anchors.topMargin: 0
                        anchors.bottomMargin: 0
                        anchors.leftMargin: 0
                        anchors.rightMargin: 0

                        LeftBtns {
                            id: homeBtn
                            width: 60
                            isactivebtn: true
                            iconheigth: 30
                            iconwidth: 30
                            leftAnchor: 12
                            onClicked: {
                                internal.changePageName("| HOME")
                                homeBtn.isactivebtn = true
                                downBtn.isactivebtn = false
                                videoBtn.isactivebtn = false
                                audioBtn.isactivebtn = false
                                settingsBtn.isactivebtn = false
                                stacklay.currentIndex = 0
                            }
                        }

                        LeftBtns {
                            id: downBtn
                            width: 60
                            iconSource: "../images/svg/Merge.svg"
                            iconheigth: 30
                            leftAnchor: 12
                            iconwidth: 30
                            onClicked: {
                                internal.changePageName("| MERGER")
                                homeBtn.isactivebtn = false
                                downBtn.isactivebtn = true
                                videoBtn.isactivebtn = false
                                audioBtn.isactivebtn = false
                                settingsBtn.isactivebtn = false
                                stacklay.currentIndex = 1
                            }
                        }

                        LeftBtns {
                            id: videoBtn
                            width: 60
                            iconSource: "../images/svg/video.svg"
                            iconheigth: 30
                            leftAnchor: 12
                            iconwidth: 30
                            onClicked: {
                                internal.changePageName("| VIDEO PLAYER")
                                homeBtn.isactivebtn = false
                                downBtn.isactivebtn = false
                                videoBtn.isactivebtn = true
                                audioBtn.isactivebtn = false
                                settingsBtn.isactivebtn = false
                                stacklay.currentIndex = 2
                            }
                        }

                        LeftBtns {
                            id: audioBtn
                            width: 60
                            iconSource: "../images/svg/audio.svg"
                            iconheigth: 30
                            leftAnchor: 12
                            iconwidth: 30
                            onClicked: {
                                internal.changePageName("| AUDIO PLAYER")
                                homeBtn.isactivebtn = false
                                downBtn.isactivebtn = false
                                videoBtn.isactivebtn = false
                                audioBtn.isactivebtn = true
                                settingsBtn.isactivebtn = false
                                stacklay.currentIndex = 3
                            }
                        }
                    }
                }

                Rectangle {
                    property alias labelBtm: despBttom.text
                    id: bttomDesp
                    y: 331
                    height: 20
                    color: "#221f3a"
                    anchors.left: leftMenu.right
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.rightMargin: 0

                    Label {
                        id: despBttom
                        color: "#9d99a9"
                        text: qsTr("")
                        anchors.fill: parent
                        anchors.rightMargin: 25
                    }
                }

                Rectangle {
                    id: contentPages
                    color: "#221f3a"
                    anchors.left: leftMenu.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 20
                    clip: true
                    anchors.leftMargin: 0

                    SwipeView {
                        id: stacklay
                        anchors.fill: parent
                        interactive: false
                        currentIndex: 0
                        Homepage {}
                        Compiler {}
                        Videopage {}
                        Auidopage {}
                        Settingspage {}
                    }
                }
            }
        }
    }

    DropShadow {
        id: dropShadow
        color: "#80000000"
        radius: 10
        horizontalOffset: 0
        z: 0
        samples: 16
        verticalOffset: 0
        anchors.fill: bg
        source: bg
    }
}
