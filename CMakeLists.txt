cmake_minimum_required(VERSION 3.14)

project(dukto-qt6 VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

#######################################################################
# CMake macros
#######################################################################
include(GNUInstallDirs)

find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Core Quick LinguistTools)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Core Quick LinguistTools)

set(TS_FILES i18n/dukto-qt6_zh_CN.ts)

set(APP_ICON_RESOURCE_WINDOWS "${CMAKE_CURRENT_SOURCE_DIR}/data/dukto.rc")

set(APP_ICON_MACOSX ${CMAKE_CURRENT_SOURCE_DIR}/data/dukto.icns)
     set_source_files_properties(${APP_ICON_MACOSX} PROPERTIES
            MACOSX_PACKAGE_LOCATION "Resources")

set(PROJECT_SOURCES
        src/main.cpp
        src/enginerunner.cpp
        src/model/buddylistitemmodel.cpp
        src/model/recentlistitemmodel.cpp
        src/model/ipaddressitemmodel.cpp
        qml.qrc
        ${TS_FILES}
        ${APP_ICON_RESOURCE_WINDOWS}
        ${APP_ICON_MACOSX}
)

if(${QT_VERSION_MAJOR} GREATER_EQUAL 6)
    qt_add_executable(dukto-qt6
        MANUAL_FINALIZATION
        ${PROJECT_SOURCES}
    )
# Define target properties for Android with Qt 6 as:
#    set_property(TARGET dukto-qt6 APPEND PROPERTY QT_ANDROID_PACKAGE_SOURCE_DIR
#                 ${CMAKE_CURRENT_SOURCE_DIR}/android)
# For more information, see https://doc.qt.io/qt-6/qt-add-executable.html#target-creation

    qt_create_translation(QM_FILES ${CMAKE_SOURCE_DIR} ${TS_FILES})
else()
    if(ANDROID)
        add_library(dukto-qt6 SHARED
            ${PROJECT_SOURCES}
        )
# Define properties for Android with Qt 5 after find_package() calls as:
#    set(ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/android")
    else()
        add_executable(dukto-qt6
          ${PROJECT_SOURCES}
        )
    endif()

    qt5_create_translation(QM_FILES ${CMAKE_SOURCE_DIR} ${TS_FILES})
endif()

set(QAPPLICATION_CLASS QGuiApplication)
add_subdirectory(third-party/singleapplication)

target_include_directories(dukto-qt6 PRIVATE src)

target_link_libraries(dukto-qt6 PRIVATE
    Qt${QT_VERSION_MAJOR}::Core
    Qt${QT_VERSION_MAJOR}::Quick
    SingleApplication::SingleApplication
)

set_target_properties(dukto-qt6 PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER msec.it
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE_ICON_FILE data/dukto.icns
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

install(TARGETS dukto-qt6
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})

if(UNIX AND NOT APPLE)
    add_subdirectory(data)
endif()

if(QT_VERSION_MAJOR EQUAL 6)
    qt_import_qml_plugins(dukto-qt6)
    qt_finalize_executable(dukto-qt6)
endif()
