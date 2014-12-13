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

#include <QtGui/QGuiApplication>
#include <QtQuick>
#include "ui/uiconnection.h"
#include "core/gamemaster.h"
#include <QTranslator>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine viewer(QUrl("qrc:///qml/android-reversi/main.qml"));

    QTranslator *translator = new QTranslator();
    QTranslator *coreTranslator = new QTranslator();

    translator->load(QString(":translation/android-reversi-ui_%1").arg(QLocale::system().name()));
    coreTranslator->load(QString(":translation/reversi-core_%1").arg(QLocale::system().name()));

    app.installTranslator(translator);
    app.installTranslator(coreTranslator);

    Gamemaster master;

    viewer.rootContext()->setContextProperty("gamemaster", &master);

    UIConnection connection(translator, coreTranslator);

    viewer.rootContext()->setContextProperty("uiconnection", &connection);

    QQuickWindow *window = qobject_cast<QQuickWindow *>(viewer.rootObjects().first());
    window->showFullScreen();

    return app.exec();
}
