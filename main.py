# This Python file uses the following encoding: utf-8
# @Author  : Thirumurugan
# @Title   : Youtube Video Downloader With Modern GUI
import sys
import os
from threading import Thread
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal, QTimer
from pytube import YouTube
import os
from urllib.error import URLError
from pytube.helpers import RegexMatchError
import ffmpeg

# Global Variables
flag1 = ""
flag2 = True
visibilityFlag = ""
audioQuality = {}
videoQuality_webm = {}
videoQuality_mp4 = {}
byteRemains = ""
progress = 0
cwd = str(os.getcwd()).replace("\\", "/")


# pip install git+https://github.com/nficano/pytube.git
def progress_Check(stream=None, chunk=None, bytes_remaining=None):
    global byteRemains, progress
    size = stream.filesize
    byteRemains = bytes_remaining
    progress = int((float(abs(bytes_remaining - size) / size)) * float(100))


class YouDownload:
    def __init__(self, url):
        global audioQuality, videoQuality_mp4, videoQuality_webm, visibilityFlag
        audioQuality = {}
        videoQuality_webm = {}
        videoQuality_mp4 = {}
        if not os.path.exists(cwd + "/Video"):
            os.mkdir(cwd + "/Video")
        if not os.path.exists(cwd + "/Audio"):
            os.mkdir(cwd + "/Audio")
        if not os.path.exists(cwd + "/Video/Mp4"):
            os.mkdir(cwd + "/Video/Mp4")
        if not os.path.exists(cwd + "/Video/Webm"):
            os.mkdir(cwd + "/Video/Webm")
        try:
            self.downloader = YouTube(url, on_progress_callback=progress_Check)

        except URLError:
            raise ConnectionError("Check Your Internet Connection")
        except RegexMatchError:
            raise Exception("Something Went Wrong Please Check Your URL")
        except Exception as e:
            print(e)
        for i in self.downloader.streams.filter(only_audio=True):
            audioQuality.update({str(i).split('abr="')[1].split('" ')[0]: i})
        for j in self.downloader.streams.filter():
            if 'mime_type="video/webm"' in str(j):
                if 'progressive="True"' in str(j):
                    videoQuality_webm.update(
                        {str(j).split('res="')[1].split('" ')[0] + "/" + str(j).split('fps="')[1].split('" ')[0]: j})
                else:
                    videoQuality_webm.update(
                        {str(j).split('res="')[1].split('" ')[0] + "/" + str(j).split('fps="')[1].split('" ')[
                            0] + "(Only Video)": j})
            if 'mime_type="video/mp4"' in str(j):
                if 'progressive="True"' in str(j):
                    videoQuality_mp4.update(
                        {str(j).split('res="')[1].split('" ')[0] + "/" + str(j).split('fps="')[1].split('" ')[0]: j})
                else:
                    videoQuality_mp4.update(
                        {str(j).split('res="')[1].split('" ')[0] + "/" + str(j).split('fps="')[1].split('" ')[
                            0] + "(Only Video)": j})
        visibilityFlag = True

    @staticmethod
    def download(pyObject, fileType, videoType=None):

        if fileType == "mp4":
            if videoType == "Mp4":
                os.chdir(cwd)
                outFile = pyObject.download(os.getcwd() + "\Video\Mp4")
                os.chdir(os.getcwd() + "\Video\Mp4")
                os.rename(str(outFile).split("Mp4\\")[1],
                          str(outFile).split("Mp4\\")[1].split(".mp4")[0] + "({})".format(
                              str(pyObject).split('res="')[1].split('" f')[0]) + ".mp4")

            elif videoType == "Webm":
                os.chdir(cwd)
                outFile = pyObject.download(os.getcwd() + "\Video\Webm")
                os.chdir(os.getcwd() + "\Video\Webm")
                os.rename(str(outFile).split("Webm\\")[1],
                          str(outFile).split("Webm\\")[1].split(".webm")[0] + "({})".format(
                              str(pyObject).split('res="')[1].split('" f')[0]) + ".webm")

        elif fileType == "mp3":
            outFile = pyObject.download(cwd + "\Audio")
            os.chdir(cwd)
            os.chdir(cwd + "\Audio")
            if "mp4" in outFile:
                os.rename(str(outFile).split("Audio\\")[1],
                          str(outFile).split("Audio\\")[1].split(".mp4")[0] + "({})".format(
                              str(pyObject).split('abr="')[1].split('" ')[0]) + ".mp3")
            else:
                os.rename(str(outFile).split("Audio\\")[1],
                          str(outFile).split("Audio\\")[1].split(".webm")[0] + "({})".format(
                              str(pyObject).split('abr="')[1].split('" ')[0]) + ".mp3")


class MainWindow(QObject):
    timer = QTimer()

    def __init__(self):
        QObject.__init__(self)

        self.timer.timeout.connect(lambda: self.setPercent())

    indicatorVisible = Signal(bool)

    modelList = Signal(list)

    checkBoxChange = Signal(bool)

    printPercent = Signal(int)

    fileStatus = Signal(bool)

    returnState = Signal(bool)

    returnProgress = Signal(bool)

    def setPercent(self):
        global progress
        if progress > 0:
            self.printPercent.emit(progress)
        if progress == 100:
            progress = 0
            self.timer.stop()
            self.returnProgress.emit(True)

    @Slot(bool)
    def close(self, state):
        if state:
            exit(1)

    @Slot(str, bool)
    def printLink(self, getLink, indVisibility):
        global flag1
        try:
            flag1=True
            search_thread = Thread(target=YouDownload, args=(getLink,))
            search_thread.start()
            visibleThread = Thread(target=self.changeVisible, args=(indVisibility,))
            visibleThread.start()
            
        except Exception as e:
            print(e)

    def changeVisible(self, visibleVal):
        global flag1, visibilityFlag
        while flag1:
            if visibilityFlag:
                flag1 = False
                self.indicatorVisible.emit(not visibleVal)
                self.checkBoxChange.emit(True)
                visibilityFlag = ""
                break
            continue

    @Slot(int, int)
    def checkingDropBox(self, checkVal, videoType):
        if checkVal == 2:
            self.modelList.emit(list(audioQuality.keys()))
        if checkVal == 1:
            if videoType == 1:
                self.modelList.emit(list(videoQuality_mp4.keys()))
            elif videoType == 2:
                self.modelList.emit(list(videoQuality_webm.keys()))
            else:
                pass

    @Slot(str, str, str)
    def startDownload(self, value, state, videoType):
        global byteRemains, videoQuality_webm, videoQuality_mp4, audioQuality
        self.timer.start()
        if state == "Audio":
            Thread(target=YouDownload.download, args=(audioQuality[value], "mp3",)).start()
        elif state == "Video":
            if videoType == "Mp4":
                Thread(target=YouDownload.download, args=(videoQuality_mp4[value], "mp4", "Mp4",)).start()
            elif videoType == "Webm":
                Thread(target=YouDownload.download, args=(videoQuality_webm[value], "mp4", "Webm",)).start()

    @Slot(str, str)
    def mergeFiles(self, video, audio):
        videoPath = video.split("file:///")[1]
        audioPath = audio.split("file:///")[1]

        if '.mp4' in videoPath:

            input_audio = ffmpeg.input(audioPath)
            input_video = ffmpeg.input(videoPath)
            title = videoPath.split("/Mp4/")[1].replace('(', "[").replace(')', "]")
            process = ffmpeg.concat(input_video, input_audio, v=1, a=1).output(
                cwd + "/Video/Mp4/" + str(title))
            converterThread = Thread(target=process.run, kwargs={"overwrite_output": True})
            converterThread.start()
            Thread(target=self.convertorIndicator, args=(converterThread, "Mp4", videoPath.split("/Mp4/")[1])).start()

        elif '.webm' in videoPath:
            input_audio = ffmpeg.input(audioPath)
            input_video = ffmpeg.input(videoPath)
            title = videoPath.split("/Webm/")[1].replace('(', "[").replace(')', "]")
            process = ffmpeg.concat(input_video, input_audio, v=1, a=1).output(
                cwd + "/Video/Webm/" + str(title))
            converterThread = Thread(target=process.run, kwargs={"overwrite_output": True})
            converterThread.start()

            Thread(target=self.convertorIndicator, args=(converterThread, "Webm", videoPath.split("/Webm/")[1])).start()

    def convertorIndicator(self, threadState, videoType, title):
        global flag2
        threadState.is_alive()
        while flag2:
            if not threadState.is_alive():
                self.returnState.emit(True)
                if videoType == "Mp4":
                    os.chdir(cwd)
                    os.chdir(os.getcwd() + "\Video\Mp4")
                    os.remove(title)
                elif videoType == "Webm":
                    os.chdir(cwd)
                    os.chdir(os.getcwd() + "\Video\Webm")
                    os.remove(title)
                break
            continue


if __name__ == "__main__":

    app = QGuiApplication(sys.argv)

    engine = QQmlApplicationEngine()

    main = MainWindow()
    engine.rootContext().setContextProperty("backend", main)

    app.setOrganizationName("Thirumurugan")
    app.setOrganizationDomain("N/A")

    engine.load(os.path.join(os.path.dirname(__file__), "qml/main.qml"))

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
