add_executable(NXDNReflector
        Conf.cpp Conf.h
        CoreNetwork.cpp CoreNetwork.h
        IcomNetwork.cpp IcomNetwork.h
        KenwoodNetwork.cpp KenwoodNetwork.h
        Log.cpp Log.h
        Mutex.cpp Mutex.h
        NXDNCRC.cpp NXDNCRC.h
        NXDNLookup.cpp NXDNLookup.h
        NXDNNetwork.cpp NXDNNetwork.h
        NXDNReflector.cpp NXDNReflector.h
        StopWatch.cpp StopWatch.h
        Thread.cpp Thread.h
        Timer.cpp Timer.h
        UDPSocket.cpp UDPSocket.h
        Utils.cpp Utils.h)

target_link_libraries(NXDNReflector
        LINK_PUBLIC
        Threads::Threads)

target_compile_options(NXDNReflector
        PRIVATE
        -Wall)

install(TARGETS NXDNReflector
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE
        COMPONENT NXDNReflector)
