cmake_minimum_required(VERSION 3.16)

project(HMI_Car VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOMOC ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick Core Gui Location Positioning Multimedia)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appHMI_Car
    main.cpp
)

qt_add_qml_module(appHMI_Car
    URI HMI_Car
    QML_FILES
        Main.qml
        QML_FILES Style.qml
        QML_FILES MediaScreen.qml
        QML_FILES VehicleScreen.qml
        QML_FILES SettingsScreen.qml
        QML_FILES PhoneScreen.qml
        QML_FILES HomeScreen.qml
        RESOURCES images.qrc
        QML_FILES aaa.qml
        QML_FILES components/NavButton.qml
        QML_FILES components/ActionBtn.qml
        QML_FILES components/TireLabel.qml
        QML_FILES components/AdasToggle.qml
        QML_FILES components/HeaderBtn.qml
        QML_FILES components/DialKey.qml
        SOURCES
        SOURCES src/vehiclebackend.h src/vehiclebackend.cpp
        SOURCES
        SOURCES
        SOURCES src/climatebackend.h src/climatebackend.cpp
        RESOURCES font.qrc
)


# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appHMI_Car PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appHMI_Car
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appHMI_Car
    PRIVATE Qt6::Quick Qt6::Core Qt6::Gui Qt6::Location Qt6::Positioning Qt6::Multimedia
)

include(GNUInstallDirs)
install(TARGETS appHMI_Car
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
