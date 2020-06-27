configure_file(${CMAKE_CURRENT_SOURCE_DIR}/packaging/NXDNGateway.ini
        ${CMAKE_CURRENT_BINARY_DIR}/packaging/NXDNGateway.ini
        @ONLY)

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/packaging/debian/nxdn-gateway.service
        ${CMAKE_CURRENT_BINARY_DIR}/packaging/debian/nxdn-gateway.service
        @ONLY)

install(FILES ${CMAKE_CURRENT_BINARY_DIR}/packaging/NXDNGateway.ini
        DESTINATION ${CMAKE_INSTALL_SYSCONFDIR}
        PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ
        COMPONENT NXDNGateway)

install(FILES ${CMAKE_CURRENT_BINARY_DIR}/packaging/debian/nxdn-gateway.service
        DESTINATION ${DESTDIR}/usr/lib/systemd/system
        PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ
        COMPONENT NXDNGateway)
