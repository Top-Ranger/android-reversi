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
                text: "Reversi Version 1.4"
            }

            Text {
                width: parent.width
                font.pixelSize: variable.heightText / 2
                color: "grey"
                wrapMode: Text.Wrap

                text: "  Copyright (C) 2014 Marcus Soll
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

                text: "Qt is a C++ toolkit for cross-platform application development.

Qt provides single-source portability across MS Windows, Mac OS X, Linux, and all major commercial Unix variants. Qt is also available for embedded devices as Qt for Embedded Linux and Qt for Windows CE.

Qt is available under three different licensing options designed to accommodate the needs of our various users.

Qt licensed under our commercial license agreement is appropriate for development of proprietary/commercial software where you do not want to share any source code with third parties or otherwise cannot comply with the terms of the GNU LGPL version 2.1 or GNU GPL version 3.0.

Qt licensed under the GNU LGPL version 2.1 is appropriate for the development of Qt applications (proprietary or open source) provided you can comply with the terms and conditions of the GNU LGPL version 2.1.

Qt licensed under the GNU General Public License version 3.0 is appropriate for the development of Qt applications where you wish to use such applications in combination with software subject to the terms of the GNU GPL version 3.0 or where you are otherwise willing to comply with the terms of the GNU GPL version 3.0.

Please see qt.digia.com/product/licensing for an overview of Qt licensing.

Copyright (C) 2013 Digia Plc and/or its subsidiary(-ies).

Qt is a Digia product. See qt.digia.com for more information."
            }
        }
    }
}
