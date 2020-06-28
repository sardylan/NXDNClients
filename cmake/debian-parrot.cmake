configure_file(${CMAKE_CURRENT_SOURCE_DIR}/packaging/debian/systemd/nxdn-parrot.service
        ${CMAKE_CURRENT_BINARY_DIR}/packaging/debian/systemd/nxdn-parrot.service
        @ONLY)

install(FILES ${CMAKE_CURRENT_BINARY_DIR}/packaging/debian/systemd/nxdn-parrot.service
        DESTINATION ${DESTDIR}/usr/lib/systemd/system
        PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ
        COMPONENT NXDNParrot)

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/packaging/debian/systemd/nxdn-parrot.env
        ${CMAKE_CURRENT_BINARY_DIR}/packaging/debian/systemd/nxdn-parrot.env
        @ONLY)

install(FILES ${CMAKE_CURRENT_BINARY_DIR}/packaging/debian/systemd/nxdn-parrot.env
        DESTINATION ${DESTDIR}/etc/default/
        RENAME nxdn-parrot
        PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ
        COMPONENT NXDNParrot)
