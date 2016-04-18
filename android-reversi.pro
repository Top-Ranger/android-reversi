TEMPLATE = app

QT += qml quick
CONFIG += c++11

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

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
    src/ui/uiconnection.cpp \
    src/player/adaptivetreeaiplayer.cpp \
    src/player/controlaiplayer.cpp \
    src/player/assemblyaiplayer.cpp \
    src/player/rules/cornerrule.cpp \
    src/player/rules/endgamerule.cpp \
    src/player/rules/fewerfrontierdiscsrule.cpp \
    src/player/rules/greedyrule.cpp \
    src/player/rules/maximiseownmovementrule.cpp \
    src/player/rules/minimiseopponentmovementrule.cpp \
    src/player/rules/openingrule.cpp \
    src/player/rules/rule.cpp \
    src/player/rules/rulehelper.cpp \
    src/player/AssemblyAIPlayer/assemblyaihelper.cpp \
    src/player/AssemblyAIPlayer/centercore.cpp \
    src/player/AssemblyAIPlayer/core.cpp \
    src/player/AssemblyAIPlayer/cornercore.cpp \
    src/player/AssemblyAIPlayer/edgecore.cpp \
    src/player/AssemblyAIPlayer/freemovecore.cpp \
    src/player/AssemblyAIPlayer/frontierdiscscore.cpp \
    src/player/AssemblyAIPlayer/greedycore.cpp \
    src/player/AssemblyAIPlayer/insanecore.cpp \
    src/player/AssemblyAIPlayer/movementcore.cpp \
    src/player/AssemblyAIPlayer/areacontrolcore.cpp \
    src/player/neuralnetworkaiplayer.cpp \
    src/player/montecarloplayer.cpp

# Installation path
# target.path =

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
    src/ui/uiconnection.h \
    src/player/adaptivetreeaiplayer.h \
    src/player/controlaiplayer.h \
    src/player/assemblyaiplayer.h \
    src/player/rules/cornerrule.h \
    src/player/rules/endgamerule.h \
    src/player/rules/fewerfrontierdiscsrule.h \
    src/player/rules/greedyrule.h \
    src/player/rules/maximiseownmovementrule.h \
    src/player/rules/minimiseopponentmovementrule.h \
    src/player/rules/openingrule.h \
    src/player/rules/rule.h \
    src/player/rules/rulehelper.h \
    src/player/AssemblyAIPlayer/areacontrolcore.h \
    src/player/AssemblyAIPlayer/assemblyaihelper.h \
    src/player/AssemblyAIPlayer/centercore.h \
    src/player/AssemblyAIPlayer/core.h \
    src/player/AssemblyAIPlayer/cornercore.h \
    src/player/AssemblyAIPlayer/edgecore.h \
    src/player/AssemblyAIPlayer/freemovecore.h \
    src/player/AssemblyAIPlayer/frontierdiscscore.h \
    src/player/AssemblyAIPlayer/greedycore.h \
    src/player/AssemblyAIPlayer/insanecore.h \
    src/player/AssemblyAIPlayer/movementcore.h \
    src/player/neuralnetworkaiplayer.h \
    src/core/commons.h \
    src/core/randomhelper.h \
    src/player/montecarloplayer.h

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
    translation-ui.qrc \
    qml.qrc \
    src/player/NeuralNetworkAIPlayer/NNData.qrc

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
