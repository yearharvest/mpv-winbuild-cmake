ExternalProject_Add(fontconfig
    DEPENDS
        expat
        freetype2
        zlib
    GIT_REPOSITORY "git://anongit.freedesktop.org/fontconfig"
    GIT_SHALLOW 1
    UPDATE_COMMAND ""
    PATCH_COMMAND ${EXEC} git apply ${CMAKE_CURRENT_SOURCE_DIR}/fontconfig-*.patch
    CONFIGURE_COMMAND ${EXEC} <SOURCE_DIR>/configure
        --build=${HOST_ARCH}
        --host=${TARGET_ARCH}
        --prefix=${MINGW_INSTALL_PREFIX}
        --with-arch=${TARGET_ARCH}
        --with-expat=${MINGW_INSTALL_PREFIX}
        --disable-shared
    BUILD_COMMAND ${MAKE}
    INSTALL_COMMAND ${MAKE} install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(fontconfig)
autogen(fontconfig)
