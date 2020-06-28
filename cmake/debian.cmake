set(SYSTEM_USER nxdn)

include(cmake/debian-commons.cmake)
include(cmake/debian-gateway.cmake)
include(cmake/debian-parrot.cmake)
include(cmake/debian-reflector.cmake)

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/packaging/debian/control/postinst
        ${CMAKE_CURRENT_BINARY_DIR}/packaging/debian/control/postinst
        @ONLY)

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/packaging/debian/control/postrm
        ${CMAKE_CURRENT_BINARY_DIR}/packaging/debian/control/postrm
        @ONLY)

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/packaging/debian/control/conffiles
        ${CMAKE_CURRENT_BINARY_DIR}/packaging/debian/control/conffiles
        @ONLY)

set(CPACK_DEBIAN_PACKAGE_CONTROL_EXTRA
        "${CPACK_DEBIAN_PACKAGE_CONTROL_EXTRA};${CMAKE_CURRENT_BINARY_DIR}/packaging/debian/control/postinst")
set(CPACK_DEBIAN_PACKAGE_CONTROL_EXTRA
        "${CPACK_DEBIAN_PACKAGE_CONTROL_EXTRA};${CMAKE_CURRENT_BINARY_DIR}/packaging/debian/control/postrm")
set(CPACK_DEBIAN_PACKAGE_CONTROL_EXTRA
        "${CPACK_DEBIAN_PACKAGE_CONTROL_EXTRA};${CMAKE_CURRENT_BINARY_DIR}/packaging/debian/control/conffiles")
