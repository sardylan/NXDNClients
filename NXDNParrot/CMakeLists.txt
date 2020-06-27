add_executable(NXDNParrot
        NXDNNetwork.cpp NXDNNetwork.h
        NXDNParrot.cpp NXDNParrot.h
        Parrot.cpp Parrot.h
        StopWatch.cpp StopWatch.h
        Thread.cpp Thread.h
        Timer.cpp Timer.h
        UDPSocket.cpp UDPSocket.h
        Version.h)

target_link_libraries(NXDNParrot
        LINK_PUBLIC
        Threads::Threads)

target_compile_options(NXDNParrot
        PRIVATE
        -Wall)

install(TARGETS NXDNParrot
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE
        COMPONENT NXDNParrot)
