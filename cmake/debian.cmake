set(SYSTEM_USER nxdn)

include(cmake/debian-gateway.cmake)
include(cmake/debian-parrot.cmake)
include(cmake/debian-reflector.cmake)

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/packaging/debian/control/postinst
        ${CMAKE_CURRENT_BINARY_DIR}/packaging/debian/control/postinst
        @ONLY)

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/packaging/debian/control/postrm
        ${CMAKE_CURRENT_BINARY_DIR}/packaging/debian/control/postrm
        @ONLY)

set(CPACK_DEBIAN_PACKAGE_CONTROL_EXTRA
        "${CPACK_DEBIAN_PACKAGE_CONTROL_EXTRA};${CMAKE_CURRENT_BINARY_DIR}/packaging/debian/control/postinst")

set(CPACK_DEBIAN_PACKAGE_CONTROL_EXTRA
        "${CPACK_DEBIAN_PACKAGE_CONTROL_EXTRA};${CMAKE_CURRENT_BINARY_DIR}/packaging/debian/control/postrm")

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/packaging/debian/nxdn.logrotate
        ${CMAKE_CURRENT_BINARY_DIR}/packaging/debian/nxdn.logrotate
        @ONLY)

install(FILES ${CMAKE_CURRENT_BINARY_DIR}/packaging/debian/nxdn.logrotate
        DESTINATION ${DESTDIR}/etc/logrotate.d
        PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ
        COMPONENT NXDNReflector)

install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/NXDNReflector/NXDN.csv
        DESTINATION ${CMAKE_INSTALL_LOCALSTATEDIR}/lib/${SYSTEM_USER}
        PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ
        COMPONENT NXDNReflector)
