set(DUKTO_ICON_NAME "dukto")

install(FILES dukto.png DESTINATION "${CMAKE_INSTALL_DATADIR}/icons/hicolor/128x128/apps")

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/dukto.desktop.in
               ${CMAKE_CURRENT_BINARY_DIR}/dukto.desktop @ONLY)

install(FILES "${CMAKE_CURRENT_BINARY_DIR}/dukto.desktop"
        DESTINATION "${CMAKE_INSTALL_FULL_DATADIR}/applications")
