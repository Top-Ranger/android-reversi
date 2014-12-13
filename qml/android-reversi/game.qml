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
import QtQuick.Controls 1.3

Item {
    width: parent.width
    height: parent.height

    Flickable {

        height: parent.height
        width: parent.width
        Component.onCompleted: functions.startGame()
        boundsBehavior: Flickable.StopAtBounds
        clip: true

        contentHeight: maincolumn.height
        contentWidth: Screen.width
        flickableDirection: Flickable.VerticalFlick

        Connections {
            target: gamemaster

            onGetHumanInput: {
                functions.getHumanInput(player)
            }

            onResult: {
                functions.endOfGame(player1, player2)
            }

            onSendMessage: {
                functions.getMessage(message)
            }

            onBoardChanged: {
                functions.actualiseBoard()
            }

            onLastDiscPlayed :
            {
                functions.lastDiscPlayed(x,y)
            }
        }

        Item {
            id: variableBoard
            property string input: qsTr("Waiting...")
            property string message: ""
            property bool gamestarted: false
            property bool gamefinished: false

            property int lastChangedX: -1
            property int lastChangedY: -1
            
            property int lastClickedX: -1
            property int lastClickedY: -1

            property int currentPlayer: 0

            property int sizeDisc: Screen.height < Screen.width ? Screen.height/12 : Screen.width/12

            property int board00: 0
            property int board10: 0
            property int board20: 0
            property int board30: 0
            property int board40: 0
            property int board50: 0
            property int board60: 0
            property int board70: 0

            property int board01: 0
            property int board11: 0
            property int board21: 0
            property int board31: 0
            property int board41: 0
            property int board51: 0
            property int board61: 0
            property int board71: 0

            property int board02: 0
            property int board12: 0
            property int board22: 0
            property int board32: 0
            property int board42: 0
            property int board52: 0
            property int board62: 0
            property int board72: 0

            property int board03: 0
            property int board13: 0
            property int board23: 0
            property int board33: 0
            property int board43: 0
            property int board53: 0
            property int board63: 0
            property int board73: 0

            property int board04: 0
            property int board14: 0
            property int board24: 0
            property int board34: 0
            property int board44: 0
            property int board54: 0
            property int board64: 0
            property int board74: 0

            property int board05: 0
            property int board15: 0
            property int board25: 0
            property int board35: 0
            property int board45: 0
            property int board55: 0
            property int board65: 0
            property int board75: 0

            property int board06: 0
            property int board16: 0
            property int board26: 0
            property int board36: 0
            property int board46: 0
            property int board56: 0
            property int board66: 0
            property int board76: 0

            property int board07: 0
            property int board17: 0
            property int board27: 0
            property int board37: 0
            property int board47: 0
            property int board57: 0
            property int board67: 0
            property int board77: 0

        }

        Item {
            id: functions

            function getHumanInput(player)
            {
                if(!variableBoard.gamefinished)
                {
                    variableBoard.currentPlayer = player
                    variableBoard.input = qsTr("Player ") + player + qsTr(" do your turn")
                }
            }

            function endOfGame(score1, score2)
            {
                variableBoard.gamefinished = true
                variableBoard.input = qsTr("Finished!")
                variableBoard.message = qsTr("END OF GAME!\nPoints Player 1: ") + score1 + "\n" + qsTr("Points Player 2: ") + score2
            }

            function getMessage(newmessage)
            {
                variableBoard.message = newmessage
            }

            function buttonPressed(x,y)
            {
                variableBoard.lastClickedX = x
                variableBoard.lastClickedY = y

                if(!variableBoard.gamefinished)
                {
                    variableBoard.currentPlayer = 0
                    variableBoard.input = qsTr("Waiting...")
                }
                gamemaster.getInput(x,y)
            }

            function actualiseBoard()
            {
                variableBoard.board00 = gamemaster.getOwner(0,0)
                variableBoard.board10 = gamemaster.getOwner(1,0)
                variableBoard.board20 = gamemaster.getOwner(2,0)
                variableBoard.board30 = gamemaster.getOwner(3,0)
                variableBoard.board40 = gamemaster.getOwner(4,0)
                variableBoard.board50 = gamemaster.getOwner(5,0)
                variableBoard.board60 = gamemaster.getOwner(6,0)
                variableBoard.board70 = gamemaster.getOwner(7,0)

                variableBoard.board01 = gamemaster.getOwner(0,1)
                variableBoard.board11 = gamemaster.getOwner(1,1)
                variableBoard.board21 = gamemaster.getOwner(2,1)
                variableBoard.board31 = gamemaster.getOwner(3,1)
                variableBoard.board41 = gamemaster.getOwner(4,1)
                variableBoard.board51 = gamemaster.getOwner(5,1)
                variableBoard.board61 = gamemaster.getOwner(6,1)
                variableBoard.board71 = gamemaster.getOwner(7,1)

                variableBoard.board02 = gamemaster.getOwner(0,2)
                variableBoard.board12 = gamemaster.getOwner(1,2)
                variableBoard.board22 = gamemaster.getOwner(2,2)
                variableBoard.board32 = gamemaster.getOwner(3,2)
                variableBoard.board42 = gamemaster.getOwner(4,2)
                variableBoard.board52 = gamemaster.getOwner(5,2)
                variableBoard.board62 = gamemaster.getOwner(6,2)
                variableBoard.board72 = gamemaster.getOwner(7,2)

                variableBoard.board03 = gamemaster.getOwner(0,3)
                variableBoard.board13 = gamemaster.getOwner(1,3)
                variableBoard.board23 = gamemaster.getOwner(2,3)
                variableBoard.board33 = gamemaster.getOwner(3,3)
                variableBoard.board43 = gamemaster.getOwner(4,3)
                variableBoard.board53 = gamemaster.getOwner(5,3)
                variableBoard.board63 = gamemaster.getOwner(6,3)
                variableBoard.board73 = gamemaster.getOwner(7,3)

                variableBoard.board04 = gamemaster.getOwner(0,4)
                variableBoard.board14 = gamemaster.getOwner(1,4)
                variableBoard.board24 = gamemaster.getOwner(2,4)
                variableBoard.board34 = gamemaster.getOwner(3,4)
                variableBoard.board44 = gamemaster.getOwner(4,4)
                variableBoard.board54 = gamemaster.getOwner(5,4)
                variableBoard.board64 = gamemaster.getOwner(6,4)
                variableBoard.board74 = gamemaster.getOwner(7,4)

                variableBoard.board05 = gamemaster.getOwner(0,5)
                variableBoard.board15 = gamemaster.getOwner(1,5)
                variableBoard.board25 = gamemaster.getOwner(2,5)
                variableBoard.board35 = gamemaster.getOwner(3,5)
                variableBoard.board45 = gamemaster.getOwner(4,5)
                variableBoard.board55 = gamemaster.getOwner(5,5)
                variableBoard.board65 = gamemaster.getOwner(6,5)
                variableBoard.board75 = gamemaster.getOwner(7,5)

                variableBoard.board06 = gamemaster.getOwner(0,6)
                variableBoard.board16 = gamemaster.getOwner(1,6)
                variableBoard.board26 = gamemaster.getOwner(2,6)
                variableBoard.board36 = gamemaster.getOwner(3,6)
                variableBoard.board46 = gamemaster.getOwner(4,6)
                variableBoard.board56 = gamemaster.getOwner(5,6)
                variableBoard.board66 = gamemaster.getOwner(6,6)
                variableBoard.board76 = gamemaster.getOwner(7,6)

                variableBoard.board07 = gamemaster.getOwner(0,7)
                variableBoard.board17 = gamemaster.getOwner(1,7)
                variableBoard.board27 = gamemaster.getOwner(2,7)
                variableBoard.board37 = gamemaster.getOwner(3,7)
                variableBoard.board47 = gamemaster.getOwner(4,7)
                variableBoard.board57 = gamemaster.getOwner(5,7)
                variableBoard.board67 = gamemaster.getOwner(6,7)
                variableBoard.board77 = gamemaster.getOwner(7,7)
            }

            function startGame()
            {
                if(!variableBoard.gamestarted)
                {
                    actualiseBoard()
                    variableBoard.gamestarted = true
                    gamemaster.startGame()
                }
            }

            function lastDiscPlayed(x, y)
            {
                variableBoard.lastChangedX = x
                variableBoard.lastChangedY = y
            }
        }

        // Board

        Column {
            id: maincolumn
            width: variableBoard.sizeDisc * 8
            x: Screen.width/2 - (4 * variableBoard.sizeDisc)

            Text {
                width: parent.width
                text: qsTr("Starting the Game")
                wrapMode: Text.Wrap
                visible: !variableBoard.gamestarted
                font.pixelSize: variable.heightText
            }

            Row {
                width: parent.width

                Image {
                    height: variable.heightText
                    width: height
                    visible: !variableBoard.gamefinished
                    source: variableBoard.currentPlayer + ".png"
                }

                Text {
                    width: parent.width
                    visible: variableBoard.gamestarted
                    text: variableBoard.input
                    font.pixelSize: variable.heightText
                    wrapMode: Text.Wrap
                }
            }

            Grid {
                visible: variableBoard.gamestarted
                width: Screen.width
                columns: 8

                // First line

                Image {
                    id: button00
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    source: ((variableBoard.lastClickedX === 0 && variableBoard.lastClickedY === 0) ? "clicked" : "") + ((variableBoard.lastChangedX === 0 && variableBoard.lastChangedY === 0) ? variableBoard.board00 + "changed.png" : variableBoard.board00 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(0,0) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button10
                    source: ((variableBoard.lastClickedX === 1 && variableBoard.lastClickedY === 0) ? "clicked" : "") + ((variableBoard.lastChangedX === 1 && variableBoard.lastChangedY === 0) ? variableBoard.board10 + "changed.png" : variableBoard.board10 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(1,0) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button20
                    source: ((variableBoard.lastClickedX === 2 && variableBoard.lastClickedY === 0) ? "clicked" : "") + ((variableBoard.lastChangedX === 2 && variableBoard.lastChangedY === 0) ? variableBoard.board20 + "changed.png" : variableBoard.board20 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(2,0) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button30
                    source: ((variableBoard.lastClickedX === 3 && variableBoard.lastClickedY === 0) ? "clicked" : "") + ((variableBoard.lastChangedX === 3 && variableBoard.lastChangedY === 0) ? variableBoard.board30 + "changed.png" : variableBoard.board30 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(3,0) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button40
                    source: ((variableBoard.lastClickedX === 4 && variableBoard.lastClickedY === 0) ? "clicked" : "") + ((variableBoard.lastChangedX === 4 && variableBoard.lastChangedY === 0) ? variableBoard.board40 + "changed.png" : variableBoard.board40 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(4,0) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button50
                    source: ((variableBoard.lastClickedX === 5 && variableBoard.lastClickedY === 0) ? "clicked" : "") + ((variableBoard.lastChangedX === 5 && variableBoard.lastChangedY === 0) ? variableBoard.board50 + "changed.png" : variableBoard.board50 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(5,0) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button60
                    source: ((variableBoard.lastClickedX === 6 && variableBoard.lastClickedY === 0) ? "clicked" : "") + ((variableBoard.lastChangedX === 6 && variableBoard.lastChangedY === 0) ? variableBoard.board60 + "changed.png" : variableBoard.board60 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(6,0) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button70
                    source: ((variableBoard.lastClickedX === 7 && variableBoard.lastClickedY === 0) ? "clicked" : "") + ((variableBoard.lastChangedX === 7 && variableBoard.lastChangedY === 0) ? variableBoard.board70 + "changed.png" : variableBoard.board70 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(7,0) } }
                }

                //  Second line

                Image {
                    id: button01
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    source: ((variableBoard.lastClickedX === 0 && variableBoard.lastClickedY === 1) ? "clicked" : "") + ((variableBoard.lastChangedX === 0 && variableBoard.lastChangedY === 1) ? variableBoard.board01 + "changed.png" : variableBoard.board01 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(0,1) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button11
                    source: ((variableBoard.lastClickedX === 1 && variableBoard.lastClickedY === 1) ? "clicked" : "") + ((variableBoard.lastChangedX === 1 && variableBoard.lastChangedY === 1) ? variableBoard.board11 + "changed.png" : variableBoard.board11 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(1,1) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button21
                    source: ((variableBoard.lastClickedX === 2 && variableBoard.lastClickedY === 1) ? "clicked" : "") + ((variableBoard.lastChangedX === 2 && variableBoard.lastChangedY === 1) ? variableBoard.board21 + "changed.png" : variableBoard.board21 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(2,1) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button31
                    source: ((variableBoard.lastClickedX === 3 && variableBoard.lastClickedY === 1) ? "clicked" : "") + ((variableBoard.lastChangedX === 3 && variableBoard.lastChangedY === 1) ? variableBoard.board31 + "changed.png" : variableBoard.board31 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(3,1) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button41
                    source: ((variableBoard.lastClickedX === 4 && variableBoard.lastClickedY === 1) ? "clicked" : "") + ((variableBoard.lastChangedX === 4 && variableBoard.lastChangedY === 1) ? variableBoard.board41 + "changed.png" : variableBoard.board41 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(4,1) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button51
                    source: ((variableBoard.lastClickedX === 5 && variableBoard.lastClickedY === 1) ? "clicked" : "") + ((variableBoard.lastChangedX === 5 && variableBoard.lastChangedY === 1) ? variableBoard.board51 + "changed.png" : variableBoard.board51 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(5,1) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button61
                    source: ((variableBoard.lastClickedX === 6 && variableBoard.lastClickedY === 1) ? "clicked" : "") + ((variableBoard.lastChangedX === 6 && variableBoard.lastChangedY === 1) ? variableBoard.board61 + "changed.png" : variableBoard.board61 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(6,1) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button71
                    source: ((variableBoard.lastClickedX === 7 && variableBoard.lastClickedY === 1) ? "clicked" : "") + ((variableBoard.lastChangedX === 7 && variableBoard.lastChangedY === 1) ? variableBoard.board71 + "changed.png" : variableBoard.board71 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(7,1) } }
                }

                // Third line

                Image {
                    id: button02
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    source: ((variableBoard.lastClickedX === 0 && variableBoard.lastClickedY === 2) ? "clicked" : "") + ((variableBoard.lastChangedX === 0 && variableBoard.lastChangedY === 2) ? variableBoard.board02 + "changed.png" : variableBoard.board02 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(0,2) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button12
                    source: ((variableBoard.lastClickedX === 1 && variableBoard.lastClickedY === 2) ? "clicked" : "") + ((variableBoard.lastChangedX === 1 && variableBoard.lastChangedY === 2) ? variableBoard.board12 + "changed.png" : variableBoard.board12 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(1,2) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button22
                    source: ((variableBoard.lastClickedX === 2 && variableBoard.lastClickedY === 2) ? "clicked" : "") + ((variableBoard.lastChangedX === 2 && variableBoard.lastChangedY === 2) ? variableBoard.board22 + "changed.png" : variableBoard.board22 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(2,2) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button32
                    source: ((variableBoard.lastClickedX === 3 && variableBoard.lastClickedY === 2) ? "clicked" : "") + ((variableBoard.lastChangedX === 3 && variableBoard.lastChangedY === 2) ? variableBoard.board32 + "changed.png" : variableBoard.board32 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(3,2) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button42
                    source: ((variableBoard.lastClickedX === 4 && variableBoard.lastClickedY === 2) ? "clicked" : "") + ((variableBoard.lastChangedX === 4 && variableBoard.lastChangedY === 2) ? variableBoard.board42 + "changed.png" : variableBoard.board42 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(4,2) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button52
                    source: ((variableBoard.lastClickedX === 5 && variableBoard.lastClickedY === 2) ? "clicked" : "") + ((variableBoard.lastChangedX === 5 && variableBoard.lastChangedY === 2) ? variableBoard.board52 + "changed.png" : variableBoard.board52 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(5,2) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button62
                    source: ((variableBoard.lastClickedX === 6 && variableBoard.lastClickedY === 2) ? "clicked" : "") + ((variableBoard.lastChangedX === 6 && variableBoard.lastChangedY === 2) ? variableBoard.board62 + "changed.png" : variableBoard.board62 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(6,2) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button72
                    source: ((variableBoard.lastClickedX === 7 && variableBoard.lastClickedY === 2) ? "clicked" : "") + ((variableBoard.lastChangedX === 7 && variableBoard.lastChangedY === 2) ? variableBoard.board72 + "changed.png" : variableBoard.board72 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(7,2) } }
                }

                // Fourth line

                Image {
                    id: button03
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    source: ((variableBoard.lastClickedX === 0 && variableBoard.lastClickedY === 3) ? "clicked" : "") + ((variableBoard.lastChangedX === 0 && variableBoard.lastChangedY === 3) ? variableBoard.board03 + "changed.png" : variableBoard.board03 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(0,3) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button13
                    source: ((variableBoard.lastClickedX === 1 && variableBoard.lastClickedY === 3) ? "clicked" : "") + ((variableBoard.lastChangedX === 1 && variableBoard.lastChangedY === 3) ? variableBoard.board13 + "changed.png" : variableBoard.board13 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(1,3) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button23
                    source: ((variableBoard.lastClickedX === 2 && variableBoard.lastClickedY === 3) ? "clicked" : "") + ((variableBoard.lastChangedX === 2 && variableBoard.lastChangedY === 3) ? variableBoard.board23 + "changed.png" : variableBoard.board23 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(2,3) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button33
                    source: ((variableBoard.lastClickedX === 3 && variableBoard.lastClickedY === 3) ? "clicked" : "") + ((variableBoard.lastChangedX === 3 && variableBoard.lastChangedY === 3) ? variableBoard.board33 + "changed.png" : variableBoard.board33 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(3,3) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button43
                    source: ((variableBoard.lastClickedX === 4 && variableBoard.lastClickedY === 3) ? "clicked" : "") + ((variableBoard.lastChangedX === 4 && variableBoard.lastChangedY === 3) ? variableBoard.board43 + "changed.png" : variableBoard.board43 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(4,3) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button53
                    source: ((variableBoard.lastClickedX === 5 && variableBoard.lastClickedY === 3) ? "clicked" : "") + ((variableBoard.lastChangedX === 5 && variableBoard.lastChangedY === 3) ? variableBoard.board53 + "changed.png" : variableBoard.board53 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(5,3) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button63
                    source: ((variableBoard.lastClickedX === 6 && variableBoard.lastClickedY === 3) ? "clicked" : "") + ((variableBoard.lastChangedX === 6 && variableBoard.lastChangedY === 3) ? variableBoard.board63 + "changed.png" : variableBoard.board63 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(6,3) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button73
                    source: ((variableBoard.lastClickedX === 7 && variableBoard.lastClickedY === 3) ? "clicked" : "") + ((variableBoard.lastChangedX === 7 && variableBoard.lastChangedY === 3) ? variableBoard.board73 + "changed.png" : variableBoard.board73 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(7,3) } }
                }

                // Fifth line

                Image {
                    id: button04
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    source: ((variableBoard.lastClickedX === 0 && variableBoard.lastClickedY === 4) ? "clicked" : "") + ((variableBoard.lastChangedX === 0 && variableBoard.lastChangedY === 4) ? variableBoard.board04 + "changed.png" : variableBoard.board04 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(0,4) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button14
                    source: ((variableBoard.lastClickedX === 1 && variableBoard.lastClickedY === 4) ? "clicked" : "") + ((variableBoard.lastChangedX === 1 && variableBoard.lastChangedY === 4) ? variableBoard.board14 + "changed.png" : variableBoard.board14 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(1,4) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button24
                    source: ((variableBoard.lastClickedX === 2 && variableBoard.lastClickedY === 4) ? "clicked" : "") + ((variableBoard.lastChangedX === 2 && variableBoard.lastChangedY === 4) ? variableBoard.board24 + "changed.png" : variableBoard.board24 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(2,4) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button34
                    source: ((variableBoard.lastClickedX === 3 && variableBoard.lastClickedY === 4) ? "clicked" : "") + ((variableBoard.lastChangedX === 3 && variableBoard.lastChangedY === 4) ? variableBoard.board34 + "changed.png" : variableBoard.board34 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(3,4) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button44
                    source: ((variableBoard.lastClickedX === 4 && variableBoard.lastClickedY === 4) ? "clicked" : "") + ((variableBoard.lastChangedX === 4 && variableBoard.lastChangedY === 4) ? variableBoard.board44 + "changed.png" : variableBoard.board44 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(4,4) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button54
                    source: ((variableBoard.lastClickedX === 5 && variableBoard.lastClickedY === 4) ? "clicked" : "") + ((variableBoard.lastChangedX === 5 && variableBoard.lastChangedY === 4) ? variableBoard.board54 + "changed.png" : variableBoard.board54 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(5,4) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button64
                    source: ((variableBoard.lastClickedX === 6 && variableBoard.lastClickedY === 4) ? "clicked" : "") + ((variableBoard.lastChangedX === 6 && variableBoard.lastChangedY === 4) ? variableBoard.board64 + "changed.png" : variableBoard.board64 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(6,4) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button74
                    source: ((variableBoard.lastClickedX === 7 && variableBoard.lastClickedY === 4) ? "clicked" : "") + ((variableBoard.lastChangedX === 7 && variableBoard.lastChangedY === 4) ? variableBoard.board74 + "changed.png" : variableBoard.board74 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(7,4) } }
                }

                // Sixth line

                Image {
                    id: button05
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    source: ((variableBoard.lastClickedX === 0 && variableBoard.lastClickedY === 5) ? "clicked" : "") + ((variableBoard.lastChangedX === 0 && variableBoard.lastChangedY === 5) ? variableBoard.board05 + "changed.png" : variableBoard.board05 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(0,5) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button15
                    source: ((variableBoard.lastClickedX === 1 && variableBoard.lastClickedY === 5) ? "clicked" : "") + ((variableBoard.lastChangedX === 1 && variableBoard.lastChangedY === 5) ? variableBoard.board15 + "changed.png" : variableBoard.board15 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(1,5) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button25
                    source: ((variableBoard.lastClickedX === 2 && variableBoard.lastClickedY === 5) ? "clicked" : "") + ((variableBoard.lastChangedX === 2 && variableBoard.lastChangedY === 5) ? variableBoard.board25 + "changed.png" : variableBoard.board25 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(2,5) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button35
                    source: ((variableBoard.lastClickedX === 3 && variableBoard.lastClickedY === 5) ? "clicked" : "") + ((variableBoard.lastChangedX === 3 && variableBoard.lastChangedY === 5) ? variableBoard.board35 + "changed.png" : variableBoard.board35 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(3,5) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button45
                    source: ((variableBoard.lastClickedX === 4 && variableBoard.lastClickedY === 5) ? "clicked" : "") + ((variableBoard.lastChangedX === 4 && variableBoard.lastChangedY === 5) ? variableBoard.board45 + "changed.png" : variableBoard.board45 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(4,5) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button55
                    source: ((variableBoard.lastClickedX === 5 && variableBoard.lastClickedY === 5) ? "clicked" : "") + ((variableBoard.lastChangedX === 5 && variableBoard.lastChangedY === 5) ? variableBoard.board55 + "changed.png" : variableBoard.board55 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(5,5) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button65
                    source: ((variableBoard.lastClickedX === 6 && variableBoard.lastClickedY === 5) ? "clicked" : "") + ((variableBoard.lastChangedX === 6 && variableBoard.lastChangedY === 5) ? variableBoard.board65 + "changed.png" : variableBoard.board65 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(6,5) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button75
                    source: ((variableBoard.lastClickedX === 7 && variableBoard.lastClickedY === 5) ? "clicked" : "") + ((variableBoard.lastChangedX === 7 && variableBoard.lastChangedY === 5) ? variableBoard.board75 + "changed.png" : variableBoard.board75 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(7,5) } }
                }

                // Seventh line

                Image {
                    id: button06
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    source: ((variableBoard.lastClickedX === 0 && variableBoard.lastClickedY === 6) ? "clicked" : "") + ((variableBoard.lastChangedX === 0 && variableBoard.lastChangedY === 6) ? variableBoard.board06 + "changed.png" : variableBoard.board06 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(0,6) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button16
                    source: ((variableBoard.lastClickedX === 1 && variableBoard.lastClickedY === 6) ? "clicked" : "") + ((variableBoard.lastChangedX === 1 && variableBoard.lastChangedY === 6) ? variableBoard.board16 + "changed.png" : variableBoard.board16 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(1,6) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button26
                    source: ((variableBoard.lastClickedX === 2 && variableBoard.lastClickedY === 6) ? "clicked" : "") + ((variableBoard.lastChangedX === 2 && variableBoard.lastChangedY === 6) ? variableBoard.board26 + "changed.png" : variableBoard.board26 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(2,6) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button36
                    source: ((variableBoard.lastClickedX === 3 && variableBoard.lastClickedY === 6) ? "clicked" : "") + ((variableBoard.lastChangedX === 3 && variableBoard.lastChangedY === 6) ? variableBoard.board36 + "changed.png" : variableBoard.board36 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(3,6) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button46
                    source: ((variableBoard.lastClickedX === 4 && variableBoard.lastClickedY === 6) ? "clicked" : "") + ((variableBoard.lastChangedX === 4 && variableBoard.lastChangedY === 6) ? variableBoard.board46 + "changed.png" : variableBoard.board46 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(4,6) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button56
                    source: ((variableBoard.lastClickedX === 5 && variableBoard.lastClickedY === 6) ? "clicked" : "") + ((variableBoard.lastChangedX === 5 && variableBoard.lastChangedY === 6) ? variableBoard.board56 + "changed.png" : variableBoard.board56 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(5,6) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button66
                    source: ((variableBoard.lastClickedX === 6 && variableBoard.lastClickedY === 6) ? "clicked" : "") + ((variableBoard.lastChangedX === 6 && variableBoard.lastChangedY === 6) ? variableBoard.board66 + "changed.png" : variableBoard.board66 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(6,6) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button76
                    source: ((variableBoard.lastClickedX === 7 && variableBoard.lastClickedY === 6) ? "clicked" : "") + ((variableBoard.lastChangedX === 7 && variableBoard.lastChangedY === 6) ? variableBoard.board76 + "changed.png" : variableBoard.board76 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(7,6) } }
                }

                // Eighth line

                Image {
                    id: button07
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    source: ((variableBoard.lastClickedX === 0 && variableBoard.lastClickedY === 7) ? "clicked" : "") + ((variableBoard.lastChangedX === 0 && variableBoard.lastChangedY === 7) ? variableBoard.board07 + "changed.png" : variableBoard.board07 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(0,7) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button17
                    source: ((variableBoard.lastClickedX === 1 && variableBoard.lastClickedY === 7) ? "clicked" : "") + ((variableBoard.lastChangedX === 1 && variableBoard.lastChangedY === 7) ? variableBoard.board17 + "changed.png" : variableBoard.board17 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(1,7) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button27
                    source: ((variableBoard.lastClickedX === 2 && variableBoard.lastClickedY === 7) ? "clicked" : "") + ((variableBoard.lastChangedX === 2 && variableBoard.lastChangedY === 7) ? variableBoard.board27 + "changed.png" : variableBoard.board27 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(2,7) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button37
                    source: ((variableBoard.lastClickedX === 3 && variableBoard.lastClickedY === 7) ? "clicked" : "") + ((variableBoard.lastChangedX === 3 && variableBoard.lastChangedY === 7) ? variableBoard.board37 + "changed.png" : variableBoard.board37 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(3,7) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button47
                    source: ((variableBoard.lastClickedX === 4 && variableBoard.lastClickedY === 7) ? "clicked" : "") + ((variableBoard.lastChangedX === 4 && variableBoard.lastChangedY === 7) ? variableBoard.board47 + "changed.png" : variableBoard.board47 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(4,7) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button57
                    source: ((variableBoard.lastClickedX === 5 && variableBoard.lastClickedY === 7) ? "clicked" : "") + ((variableBoard.lastChangedX === 5 && variableBoard.lastChangedY === 7) ? variableBoard.board57 + "changed.png" : variableBoard.board57 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(5,7) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button67
                    source: ((variableBoard.lastClickedX === 6 && variableBoard.lastClickedY === 7) ? "clicked" : "") + ((variableBoard.lastChangedX === 6 && variableBoard.lastChangedY === 7) ? variableBoard.board67 + "changed.png" : variableBoard.board67 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(6,7) } }
                }

                Image {
                    width: variableBoard.sizeDisc
                    height: variableBoard.sizeDisc
                    id: button77
                    source: ((variableBoard.lastClickedX === 7 && variableBoard.lastClickedY === 7) ? "clicked" : "") + ((variableBoard.lastChangedX === 7 && variableBoard.lastChangedY === 7) ? variableBoard.board77 + "changed.png" : variableBoard.board77 + ".png")
                    MouseArea { height: parent.height; width: parent.width; onClicked: { functions.buttonPressed(7,7) } }
                }
            }

            Text {
                width: parent.width
                visible: variableBoard.gamestarted
                text: variableBoard.message
                font.pixelSize: variable.heightText
                wrapMode: Text.Wrap
            }

            Button {
                width: parent.width
                visible: variableBoard.gamefinished
                text: qsTr("Restart game")
                onClicked: {
                    gamemaster.initialise(variable.player1, variable.player2, 0)
                    pageStack.push({item: Qt.resolvedUrl("game.qml"), replace:true})
                }
            }
        }
    }
}
