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

find_package(PkgConfig REQUIRED)

find_package(Threads REQUIRED)
message("Threads flags: ${CMAKE_THREAD_LIBS_INIT}")

execute_process(COMMAND /bin/bash "${CMAKE_CURRENT_SOURCE_DIR}/cmake/git_version.sh"
        WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
        OUTPUT_VARIABLE GIT_TAG)

set(NXDN_VERSION "${GIT_TAG}")
string(STRIP NXDN_VERSION, ${NXDN_VERSION})
string(REGEX REPLACE "\n$" "" NXDN_VERSION "${NXDN_VERSION}")

message("NXDN Version: ${NXDN_VERSION}")

add_subdirectory(NXDNGateway)
add_subdirectory(NXDNParrot)
add_subdirectory(NXDNReflector)

include(cmake/packaging.cmake)
