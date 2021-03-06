QT += widgets qml quick serialport
CONFIG += console
TARGET = application

SOURCES += \
    main.cpp \
    rs232visualizermain.cpp \
    serialconnect.cpp

OTHER_FILES += \
    qml/main.qml \
    bitmaps/logo.png \
    qml/FileDialogOpen.qml \
    qml/FileDialogSave.qml \
    qml/SerialDataTerminal.qml \
    qml/SerialPortSettingsDialog.qml

RESOURCES += \
    resources.qrc

MOC_DIR = ./.moc
OBJECTS_DIR = ./.obj
UI_DIR = ./.ui
RCC_DIR = ./.rcc

HEADERS +=  rs232visualizermain.h \
    serialconnect.h \
    appsettings.h

ICON += bitmaps/logo.png

CONFIG(release, debug|release):DEFINES += QT_NO_DEBUG_OUTPUT
