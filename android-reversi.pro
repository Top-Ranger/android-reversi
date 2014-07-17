# Add more folders to ship with the application, here
folder_01.source = qml/android-reversi
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

release {
    DEFINES += QT_NO_DEBUG_OUTPUT
}

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += src/main.cpp \
  src/core/gamemaster.cpp \
    src/core/gameboard.cpp \
    src/player/balancedaiplayer.cpp \
    src/player/greedyaiplayer.cpp \
    src/player/humanplayer.cpp \
    src/player/player.cpp \
    src/player/randomaiplayer.cpp \
    src/player/staticruleaiplayer.cpp \
    src/player/treeaiplayer.cpp \
    src/player/tutorialplayer.cpp \
    src/rules/cornerrule.cpp \
    src/rules/endgamerule.cpp \
    src/rules/fewerfrontierdiscsrule.cpp \
    src/rules/greedyrule.cpp \
    src/rules/maximiseownmovementrule.cpp \
    src/rules/minimiseopponentmovementrule.cpp \
    src/rules/openingrule.cpp \
    src/rules/rule.cpp \
    src/ui/uiconnection.cpp \
    src/player/adaptivetreeaiplayer.cpp \
    src/player/controlaiplayer.cpp

# Installation path
# target.path =

# Please do not modify the following two lines. Required for deployment.
include(qtquick2applicationviewer/qtquick2applicationviewer.pri)
qtcAddDeployment()

HEADERS += \
    src/core/gameboard.h \
    src/core/gamemaster.h \
    src/player/balancedaiplayer.h \
    src/player/greedyaiplayer.h \
    src/player/humanplayer.h \
    src/player/player.h \
    src/player/randomaiplayer.h \
    src/player/staticruleaiplayer.h \
    src/player/treeaiplayer.h \
    src/player/tutorialplayer.h \
    src/rules/cornerrule.h \
    src/rules/endgamerule.h \
    src/rules/fewerfrontierdiscsrule.h \
    src/rules/greedyrule.h \
    src/rules/maximiseownmovementrule.h \
    src/rules/minimiseopponentmovementrule.h \
    src/rules/openingrule.h \
    src/rules/rule.h \
    src/ui/uiconnection.h \
    src/player/adaptivetreeaiplayer.h \
    src/player/controlaiplayer.h

OTHER_FILES += \
    src/translation/reversi-core_de.ts \
    src/translation/reversi-core_en.ts \
    android-reversi-ui_de.ts \
    android-reversi-ui_en.ts \
    templates/0.svg \
    templates/0changed.svg \
    templates/1.svg \
    templates/1changed.svg \
    templates/2.svg \
    templates/2changed.svg \
    templates/android-reversi.svg \
    android/AndroidManifest.xml \
    .gitignore \
    LICENSE.txt \
    README.md \
    templates/clicked0.svg \
    templates/clicked0changed.svg \
    templates/clicked1.svg \
    templates/clicked1changed.svg \
    templates/clicked2.svg \
    templates/clicked2changed.svg

RESOURCES += \
    src/translation/core-translation.qrc \
    translation-ui.qrc

SUBDIRS += \
    android-reversi-ui.pro \
    src/translation/reversi-core.pro

QMAKE_CXXFLAGS += -std=gnu++11

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
