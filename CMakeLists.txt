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

execute_process(COMMAND bash "${CMAKE_CURRENT_SOURCE_DIR}/cmake/git_version.sh"
        WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
        OUTPUT_VARIABLE GIT_TAG)
string(REGEX REPLACE "\n$" "" GIT_TAG "${GIT_TAG}")

set(NXDN_VERSION "0.9.0-git-${GIT_TAG}")
message("NXDN Version: ${NXDN_VERSION}")

add_subdirectory(NXDNGateway)
add_subdirectory(NXDNParrot)
add_subdirectory(NXDNReflector)

include(cmake/packaging.cmake)
