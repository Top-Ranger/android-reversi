/*
  Copyright (C) 2014,2015 Marcus Soll
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
import QtQuick.Controls 1.3

ApplicationWindow {
    id: window

    width: Screen.width
    height: Screen.height

    Item {
        id: variable

        property int heightText: (Screen.height / 20) * 2 / 3
        property int list1save: 0
        property int list2save: 0
        property string player1: "Human"
        property string player2: "Human"
    }

    Item {
        focus: true
        Keys.onReleased: {
            if(event.key === Qt.Key_Back)
            {
                if(pageStack.depth > 1)
                {
                    pageStack.pop()

                }

                event.accepted = true
            }
        }
    }

    menuBar: MenuBar {
        id: menu

        Menu {
            visible: pageStack.depth > 1
            title: qsTr("Actions") + uiconnection.retranslate_append
            MenuItem { text: qsTr("Back") + uiconnection.retranslate_append; visible: pageStack.depth > 1; onTriggered: pageStack.pop() }
        }

        Menu {
            id: helpMenu
            title: qsTr("Help") + uiconnection.retranslate_append
            MenuItem { text: qsTr("Rules") + uiconnection.retranslate_append; onTriggered: pageStack.push(Qt.resolvedUrl("rules.qml")) }
            MenuItem { text: qsTr("About") + uiconnection.retranslate_append; onTriggered: pageStack.push(Qt.resolvedUrl("about.qml")) }
        }

    }

    StackView {
        id: pageStack
        initialItem: Qt.resolvedUrl('start.qml')
    }
}

