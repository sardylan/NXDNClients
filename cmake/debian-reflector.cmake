configure_file(${CMAKE_CURRENT_SOURCE_DIR}/packaging/NXDNReflector.ini
        ${CMAKE_CURRENT_BINARY_DIR}/packaging/NXDNReflector.ini
        @ONLY)

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/packaging/debian/nxdn-reflector.service
        ${CMAKE_CURRENT_BINARY_DIR}/packaging/debian/nxdn-reflector.service
        @ONLY)

install(FILES ${CMAKE_CURRENT_BINARY_DIR}/packaging/NXDNReflector.ini
        DESTINATION ${CMAKE_INSTALL_SYSCONFDIR}
        PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ
        COMPONENT NXDNReflector)

install(FILES ${CMAKE_CURRENT_BINARY_DIR}/packaging/debian/nxdn-reflector.service
        DESTINATION ${DESTDIR}/usr/lib/systemd/system
        PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ
        COMPONENT NXDNReflector)
