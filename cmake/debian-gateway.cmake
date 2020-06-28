configure_file(${CMAKE_CURRENT_SOURCE_DIR}/packaging/NXDNGateway.ini
        ${CMAKE_CURRENT_BINARY_DIR}/packaging/NXDNGateway.ini
        @ONLY)

install(FILES ${CMAKE_CURRENT_BINARY_DIR}/packaging/NXDNGateway.ini
        DESTINATION ${CMAKE_INSTALL_SYSCONFDIR}
        PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ
        COMPONENT NXDNGateway)

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/packaging/debian/systemd/nxdn-gateway.service
        ${CMAKE_CURRENT_BINARY_DIR}/packaging/debian/systemd/nxdn-gateway.service
        @ONLY)

install(FILES ${CMAKE_CURRENT_BINARY_DIR}/packaging/debian/systemd/nxdn-gateway.service
        DESTINATION ${DESTDIR}/usr/lib/systemd/system
        PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ
        COMPONENT NXDNGateway)
