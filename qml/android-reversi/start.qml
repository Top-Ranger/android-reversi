/*
  Copyright (C) 2014 Marcus Soll
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Jolla Ltd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import QtQuick 2.0
import QtQuick.Window 2.1

Item {
    width: Screen.width
    height: Screen.height - variable.heightButton

    Flickable {
        width: Screen.width
        height: Screen.height - variable.heightButton

        contentHeight: start.height
        contentWidth: Screen.width
        flickableDirection: Flickable.VerticalFlick
        clip: true

        boundsBehavior: Flickable.StopAtBounds

        Column {
            width: parent.width
            id: start

            Rectangle {
                width: Screen.width
                height: variable.heightButton
                color: "grey"

                Text {
                    height: parent.height
                    text: qsTr("About")
                    color: "white"
                    font.pixelSize: variable.heightText
                    anchors.centerIn: parent
                }

                MouseArea {
                    height: parent.height
                    width: parent.width
                    onClicked: {
                        loader.setSource("about.qml")
                    }
                }
            }

            Rectangle {
                width: Screen.width
                height: variable.heightButton
                color: "grey"

                Text {
                    height: parent.height
                    text: qsTr("Rules")
                    color: "white"
                    font.pixelSize: variable.heightText
                    anchors.centerIn: parent
                }

                MouseArea {
                    height: parent.height
                    width: parent.width
                    onClicked: {
                        loader.setSource("rules.qml")
                    }
                }
            }

            Rectangle {
                width: Screen.width
                height: variable.heightText
                color: "grey"

                Text {
                    height: parent.height
                    text: qsTr("Start game")
                    color: "white"
                    font.pixelSize: variable.heightText
                    anchors.centerIn: parent
                }

                MouseArea {
                    height: parent.height
                    width: parent.width
                    onClicked: {
                        gamemaster.initialise(list1.currentItem.text ,list2.currentItem.text ,0)
                        loader.setSource("game.qml")
                    }
                }
            }

            Row {
                width: Screen.width / 3 * 2

                Column {
                    width: Screen.width / 2

                    Row {
                        Image {
                            height: variable.heightText
                            width: height
                            source: "1.png"
                        }

                        Text {
                            font.pixelSize: variable.heightText
                            font.underline: true
                            font.bold: true
                            text: qsTr("Player 1:")
                            color: "white"
                        }
                    }

                    ListView {
                        id: list1
                        width: parent.width
                        height: Screen.height / 2
                        currentIndex: variable.list1save

                        boundsBehavior: Flickable.StopAtBounds

                        model: ListModel {
                            ListElement { name: "Human" }
                            ListElement { name: "Tutorial" }
                            ListElement { name: "Random AI" }
                            ListElement { name: "Greedy AI"}
                            ListElement { name: "Tree AI"}
                            ListElement { name: "Balanced AI"}
                            ListElement { name: "Static Rule AI"}
                            ListElement { name: "Adaptive Tree AI"}
                            ListElement { name: "Control AI"}
                        }

                        delegate: Text { width: parent.width; color: "white"; font.pixelSize: variable.heightText; text: name; wrapMode: Text.Wrap
                            MouseArea { width: parent.width; height: parent.height; onClicked: variable.list1save = index}
                        }

                        highlight: Rectangle { color: "lightgreen"; radius: 5}
                    }
                }

                Column {
                    width: Screen.width / 2
                    x: Screen.width / 2

                    Row {
                        Image {
                            height: variable.heightText
                            width: height
                            source: "2.png"
                        }

                        Text {
                            font.pixelSize: variable.heightText
                            font.underline: true
                            font.bold: true
                            text: qsTr("Player 2:")
                            color: "white"
                        }
                    }

                    ListView {
                        id: list2
                        width: parent.width
                        height: Screen.height / 2
                        currentIndex: variable.list2save

                        boundsBehavior: Flickable.StopAtBounds

                        model: ListModel {
                            ListElement { name: "Human" }
                            ListElement { name: "Tutorial" }
                            ListElement { name: "Random AI" }
                            ListElement { name: "Greedy AI"}
                            ListElement { name: "Tree AI"}
                            ListElement { name: "Balanced AI"}
                            ListElement { name: "Static Rule AI"}
                            ListElement { name: "Adaptive Tree AI"}
                            ListElement { name: "Control AI"}
                        }

                        delegate: Text { width: parent.width; color: "white"; font.pixelSize: variable.heightText; text: name; wrapMode: Text.Wrap
                            MouseArea { width: parent.width; height: parent.height; onClicked: variable.list2save = index}
                        }

                        highlight: Rectangle { color: "lightgreen"; radius: 5}
                    }
                }
            }

            Text {
                id: languageText
                font.pixelSize: variable.heightText
                font.underline: true
                font.bold: true
                x: Screen.width / 2 - (width / 2)
                wrapMode: Text.Wrap
                text: qsTr("Language:")
                color: "white"
            }

            ListView {
                width: Screen.width / 2
                id: languageList
                height: variable.heightText * 3
                x: languageText.x
                currentIndex: 0

                boundsBehavior: Flickable.StopAtBounds

                model: ListModel {
                    ListElement { name: "de" }
                    ListElement { name: "en" }
                }

                delegate: Text { width: parent.width; color: "white"; font.pixelSize: variable.heightText; text: name; wrapMode: Text.Wrap
                    MouseArea { width: parent.width; height: parent.height; onClicked: {
                            uiconnection.changeLanguage(text)
                            loader.setSource("start.qml")
                            variable.setQuit = true
                        }
                    }
                }
            }
        }
    }
}
