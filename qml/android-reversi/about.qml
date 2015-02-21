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

Item {
    width: parent.width
    height: parent.height

    Flickable {
        id: aboutFlickable

        width: parent.width
        height: parent.height
        interactive: true
        clip: true

        contentHeight: about.height
        contentWidth: Screen.width

        Column {
            id: about
            width: parent.width
            visible: true

            Text {
                width: parent.width
                font.pixelSize: variable.heightText
                font.bold: true
                text: "Reversi Version 1.5"
            }

            Text {
                width: parent.width
                font.pixelSize: variable.heightText / 2
                color: "grey"
                wrapMode: Text.Wrap

                text: "  Copyright (C) 2014,2015 Marcus Soll
  Copyright (C) 2014 Johannes Preuß
  All rights reserved.

You may use this program under the terms of BSD license as follows:

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
* Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
* Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
* Neither the name of the Jolla Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS \"AS IS\" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. \n\n"
            }

            Text {
                font.pixelSize: variable.heightText
                font.underline: true
                text: qsTr("Translation")
            }

            Text {
                font.pixelSize: variable.heightText
                text: "de"
            }

            Text {
                text: "Marcus Soll"
                font.pixelSize: variable.heightText
                color: "grey"
            }

            Text {
                font.pixelSize: variable.heightText
                text: "en"
            }

            Text {
                text: "Marcus Soll"
                font.pixelSize: variable.heightText
                color: "grey"
            }

            Text {
                text: "Johannes Preuß"
                font.pixelSize: variable.heightText
                color: "grey"
            }


            Text {
                width: parent.width
                font.pixelSize: variable.heightText / 2
                color: "grey"
                wrapMode: Text.Wrap

                text: "\n\n"
            }

            Text {
                font.pixelSize: variable.heightText
                font.underline: true
                text: qsTr("About Qt")
            }

            Text {
                width: parent.width
                font.pixelSize: variable.heightText / 2
                color: "grey"
                wrapMode: Text.Wrap

                text: "The Qt Toolkit is Copyright (C) 2014 Digia Plc and/or its subsidiary(-ies).
Contact: http://www.qt.io/licensing

You may use, distribute and copy the Qt GUI Toolkit under the terms of GNU Lesser General Public License version 3, which supplements GNU General Public License Version 3.

You should have received a copy of the license along with this application."
            }
        }
    }
}
