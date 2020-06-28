#configure_file(${CMAKE_CURRENT_SOURCE_DIR}/packaging/debian/nxdn.logrotate
#        ${CMAKE_CURRENT_BINARY_DIR}/packaging/debian/nxdn.logrotate
#        @ONLY)

#install(FILES ${CMAKE_CURRENT_BINARY_DIR}/packaging/debian/nxdn.logrotate
#        DESTINATION ${DESTDIR}/etc/logrotate.d
#        PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ
#        COMPONENT NXDNCommons)

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/packaging/debian/nxdn.cron
        ${CMAKE_CURRENT_BINARY_DIR}/packaging/debian/nxdn.cron
        @ONLY)

install(FILES ${CMAKE_CURRENT_BINARY_DIR}/packaging/debian/nxdn.cron
        DESTINATION ${DESTDIR}/etc/cron.d/nxdn
        PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ
        COMPONENT NXDNCommons)

install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/NXDNGateway/NXDNHosts.txt
        DESTINATION ${CMAKE_INSTALL_LOCALSTATEDIR}/lib/${SYSTEM_USER}
        PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ
        COMPONENT NXDNCommons)

install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/NXDNReflector/NXDN.csv
        DESTINATION ${CMAKE_INSTALL_LOCALSTATEDIR}/lib/${SYSTEM_USER}
        PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ
        COMPONENT NXDNCommons)
