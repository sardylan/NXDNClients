pkg_check_modules(GPS REQUIRED IMPORTED_TARGET libgps>=3.20)

add_executable(NXDNGateway
        APRSWriter.cpp APRSWriter.h
        Conf.cpp Conf.h
        GPSHandler.cpp GPSHandler.h
        IcomNetwork.cpp IcomNetwork.h
        KenwoodNetwork.cpp KenwoodNetwork.h
        Log.cpp Log.h
        Mutex.cpp Mutex.h
        NXDNCRC.cpp NXDNCRC.h
        NXDNGateway.cpp NXDNGateway.h
        NXDNLookup.cpp NXDNLookup.h
        NXDNNetwork.cpp NXDNNetwork.h
        Reflectors.cpp Reflectors.h
        RingBuffer.h
        RptNetwork.cpp RptNetwork.h
        StopWatch.cpp StopWatch.h
        Thread.cpp Thread.h
        Timer.cpp Timer.h
        UDPSocket.cpp UDPSocket.h
        Utils.cpp Utils.h
        Version.h
        Voice.cpp Voice.h)

target_link_libraries(NXDNGateway
        LINK_PUBLIC
        Threads::Threads
        PkgConfig::GPS)

target_compile_options(NXDNGateway
        PRIVATE
        -Wall)

install(TARGETS NXDNGateway
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE
        COMPONENT NXDNGateway)
