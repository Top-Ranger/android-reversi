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

Rectangle {
    id: main
    width: Screen.width
    height: Screen.height
    color: "darkgreen"

    Item {
        id: variable

        property int heightButton: Screen.height / 20
        property int heightText: heightButton * 2 / 3
        property bool setQuit: true
        property bool loaderStart: true
        property int list1save: 0
        property int list2save: 0
    }

    Item {
        focus: true

        Keys.onReleased: {
            if(event.key === Qt.Key_Back)
            {
                if(variable.setQuit)
                {
                    event.accepted = true
                    Qt.quit()
                }
                else
                {
                    loader.setSource("start.qml")
                    variable.setQuit = true
                    event.accepted = true
                }
            }
        }
    }

    Column {

        Rectangle {
            width: Screen.width
            height: variable.heightButton
            color: "black"

            Text {
                height: parent.height
                text: variable.setQuit ? qsTr("Quit") : qsTr("Back")
                color: "white"
                font.pixelSize: variable.heightText
                anchors.centerIn: parent
            }

            MouseArea {
                height: parent.height
                width: parent.width
                onClicked: {
                    if(variable.setQuit)
                    {
                        Qt.quit()
                    }
                    else
                    {
                        loader.setSource("start.qml")
                        variable.setQuit = true
                    }
                }
            }
        }

        Loader {
            id: loader
            visible: true
            height: parent.height - variable.heightButton
            width: parent.width
            x: 0
            y: variable.heightButton

            source: "start.qml"

            onSourceChanged: {
                if(!variable.loaderStart)
                {
                    variable.setQuit = false
                }
                else
                {
                    variable.loaderStart = false
                }
            }
        }
    }
}
