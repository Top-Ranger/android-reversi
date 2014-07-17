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

        contentHeight: rules.height
        contentWidth: Screen.width
        flickableDirection: Flickable.VerticalFlick
        clip: true

        boundsBehavior: Flickable.StopAtBounds

        Column {
            id: rules
            width: parent.width

            Text {
                font.pixelSize: variable.heightText
                color: "white"
                text: qsTr("Rules")
                font.bold: true
                font.underline: true
            }

            Text  {
                font.pixelSize: variable.heightText
                color: "white"
                width: rules.width
                wrapMode: Text.Wrap

                text: qsTr("Both players take alternate turns. Black begins.

The goal of the game is to capture enemy pieces, also commonly known as discs, which must be captured by trapping them between your own discs. This applies on the horizontal,vertical and diagonal axis of the playing field. Each player has to capture at least one enemy disc - if a player can't capture a disc, he has to pass.

The game ends when both players are unable to capture. (However, there can still be free places on the board). The player with most discs wins.")
            }

            Text  {
                font.pixelSize: variable.heightText
                color: "lightgrey"
                width: rules.width
                wrapMode: Text.Wrap

                text: qsTr("New to \"Reversi\"? Try out the \"Tutorial\", it will teach you some basic strategies.")
            }
        }
    }
}
