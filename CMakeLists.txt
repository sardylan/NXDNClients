cmake_minimum_required(VERSION 3.1)
project(nxdn)

if (UNIX)
    include(GNUInstallDirs)
    set(CMAKE_INSTALL_SYSCONFDIR /etc/nxdn)
    set(CMAKE_INSTALL_LOCALSTATEDIR /var)
endif ()

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

set_property(GLOBAL PROPERTY USE_FOLDERS ON)

find_package(Threads REQUIRED)
message("Threads flags: ${CMAKE_THREAD_LIBS_INIT}")

set(NXDN_VERSION "20200427")

add_subdirectory(NXDNReflector)

include(cmake/packaging.cmake)
