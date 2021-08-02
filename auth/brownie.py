# -*- coding: utf-8 -*-
import os
import subprocess
import sys

import requests
import urllib3
from PyQt5.QtCore import Qt, QCoreApplication
from PyQt5.QtGui import QIcon
from PyQt5.QtWidgets import QApplication, QWidget, QPushButton, QVBoxLayout, QLineEdit, QLabel, QMessageBox
from requests.auth import HTTPBasicAuth

if getattr(sys, 'frozen', False):
    icon = os.path.join(sys._MEIPASS, "icon.ico")
else:
    icon = "icon.ico"

SERVER = "http://ririnto.asuscomm.com:80/"
urllib3.disable_warnings()


def success():
    box = QMessageBox()
    box.setWindowIcon(QIcon(icon))
    box.setIcon(QMessageBox.Information)
    box.setWindowTitle("등록 성공")
    box.setText("등록에 성공했습니다.")
    box.setStandardButtons(QMessageBox.Ok)
    box.exec_()


def fail(message):
    box = QMessageBox()
    box.setWindowIcon(QIcon(icon))
    box.setIcon(QMessageBox.Critical)
    box.setWindowTitle("등록 실패")
    box.setText(f"등록에 실패했습니다.\n\nMessage: {message}")
    box.setStandardButtons(QMessageBox.Ok)
    box.exec_()


def server_error():
    box = QMessageBox()
    box.setWindowIcon(QIcon(icon))
    box.setIcon(QMessageBox.Critical)
    box.setWindowTitle("서버 에러")
    box.setText(f"서버가 응답하지 않습니다.")
    box.setStandardButtons(QMessageBox.Ok)
    box.exec_()


class MyApp(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowIcon(QIcon(icon))

        process = subprocess.Popen("PowerShell Get-Process LeagueClient ^| Format-List Path", shell=True,
                                   stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                                   stdin=subprocess.PIPE)

        path = process.stdout \
            .read().decode("UTF-8").strip().lstrip("Path : ") \
            .rstrip("LeagueClient.exe")

        if path:
            try:
                with open(path + "lockfile", "r", encoding="UTF-8") as file:
                    data = file.read().split(":")
                    token = data[3]
                    port = int(data[2])

                self.region = requests.get(f"https://127.0.0.1:{port}/riotclient/get_region_locale",
                                           auth=HTTPBasicAuth("riot", token),
                                           verify=False)
                self.nickname = requests.get(f"https://127.0.0.1:{port}/lol-summoner/v1/current-summoner",
                                             auth=HTTPBasicAuth("riot", token),
                                             verify=False)
                if not self.nickname:
                    raise Exception
                self.qle = QLineEdit(self)
                self.init_ui()
            except Exception as e:
                print(e)
                self.exit()
        else:
            self.exit()

    def exit(self):
        label = QLabel('League Of Legends Client가 실행중이지 않습니다.', self)
        label.setAlignment(Qt.AlignCenter)
        label.font().setPointSize(20)

        btn = QPushButton('Quit', self)
        btn.clicked.connect(QCoreApplication.instance().quit)

        vbox = QVBoxLayout()
        vbox.addWidget(label)
        vbox.addWidget(btn)

        self.setLayout(vbox)
        self.setWindowTitle('BROWNIE')
        self.show()

    def init_ui(self):
        vbox = QVBoxLayout()

        label = QLabel(
            f"{self.region.json().get('region')} 서버 {self.nickname.json().get('displayName')} (으)로 등록하시겠습니까?",
            self)
        label.setAlignment(Qt.AlignCenter)
        label.font().setPointSize(20)
        vbox.addWidget(label)

        label = QLabel("Brownie에서 발급받은 키 입력 후 연동하기 버튼을 클릭하세요.",
                       self)
        label.setAlignment(Qt.AlignCenter)
        label.font().setPointSize(20)
        vbox.addWidget(label)

        self.qle.setAlignment(Qt.AlignCenter)
        vbox.addWidget(self.qle)

        btn = QPushButton("연동 하기",
                          self)

        btn.clicked.connect(self.submit)
        vbox.addWidget(btn)

        self.setLayout(vbox)
        self.setWindowTitle('BROWNIE')
        self.show()

    def submit(self):
        url = f"{SERVER}auth"
        params = {"token": self.qle.text(),
                  "region": self.region.json().get("region"),
                  "lolId": self.nickname.json().get("displayName")}
        try:
            result = requests.post(url, params=params).json()
            if result.get("status") == "ok":
                success()
            elif result.get("status") == "ng":
                fail(result.get("message"))
        except:
            server_error()


if __name__ == '__main__':
    app = QApplication(sys.argv)
    ex = MyApp()
    sys.exit(app.exec_())
