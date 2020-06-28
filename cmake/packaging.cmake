set(CPACK_PACKAGE_NAME "NXDNClients")
set(CPACK_PACKAGE_VENDOR "G4KLX")

set(CPACK_PACKAGE_VERSION "${NXDN_VERSION}")
set(CPACK_PACKAGE_CONTACT "sardylan@gmail.com")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "These programs are clients for the NXDN networking built into the MMDVM Host.")

if (UNIX AND NOT APPLE)
    set(CPACK_GENERATOR "DEB")

    execute_process(COMMAND dpkg --print-architecture
            OUTPUT_VARIABLE CPACK_DEBIAN_PACKAGE_ARCHITECTURE
            OUTPUT_STRIP_TRAILING_WHITESPACE)

    set(CPACK_DEBIAN_PACKAGE_SECTION "misc")
    set(CPACK_DEBIAN_PACKAGE_PRIORITY "optional")
    set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS TRUE)

    set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${GIT_TAG}-${CPACK_DEBIAN_PACKAGE_ARCHITECTURE}")

    include(cmake/debian.cmake)
elseif (WIN32)
    set(CPACK_GENERATOR "WIX")

    #    set(CPACK_WIX_PRODUCT_GUID "")
    #    set(CPACK_WIX_UPGRADE_GUID "")
    set(CPACK_WIX_PROPERTY_ARPHELPLINK "https://github.com/sardylan/NXDNClients")
    #    set(CPACK_WIX_PROPERTY_ARPSIZE "0")

    set(CPACK_PACKAGE_INSTALL_DIRECTORY "NXDN ${CPACK_PACKAGE_VERSION}")
    set(CPACK_PACKAGE_ICON "icons/windows/icon-256.ico")

    set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${GIT_TAG}")
elseif (APPLE)
    set(CPACK_GENERATOR "Bundle")

    set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${GIT_TAG}")
endif ()

include(CPack)

cpack_add_component(NXDNReflector
        DISPLAY_NAME "NXDN Reflector"
        DESCRIPTION "The Reflector is used as a single talk group in the same way that it is with P25."
        REQUIRED)
