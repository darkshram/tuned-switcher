#
# SPDX-FileCopyrightText: 2021-2026 EasyCoding Team and contributors
#
# SPDX-License-Identifier: GPL-3.0-or-later
#

find_program(
    DESKTOPFILEVALIDATE_EXECUTABLE
    NAMES desktop-file-validate
    DOC "desktop-file-validate executable"
)
mark_as_advanced(DESKTOPFILEVALIDATE_EXECUTABLE)

if (DESKTOPFILEVALIDATE_EXECUTABLE)
    execute_process(
        COMMAND ${DESKTOPFILEVALIDATE_EXECUTABLE} --version
        OUTPUT_VARIABLE _desktopfilevalidate_version
        ERROR_QUIET
        OUTPUT_STRIP_TRAILING_WHITESPACE
    )
    if ("${_desktopfilevalidate_version}" MATCHES "^desktop-file-validate[ \t]+([0-9.]+)")
        set(DESKTOPFILEVALIDATE_VERSION_STRING "${CMAKE_MATCH_1}")
    else()
        set(DESKTOPFILEVALIDATE_VERSION_STRING "")
    endif()
    unset(_desktopfilevalidate_version)
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(
    DesktopFileValidate
    REQUIRED_VARS DESKTOPFILEVALIDATE_EXECUTABLE
    VERSION_VAR DESKTOPFILEVALIDATE_VERSION_STRING
)
