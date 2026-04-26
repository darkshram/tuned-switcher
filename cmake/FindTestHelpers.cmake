#
# SPDX-FileCopyrightText: 2021-2026 EasyCoding Team and contributors
#
# SPDX-License-Identifier: GPL-3.0-or-later
#

if (BUILD_TESTS)
    find_program(
        AppstreamUtil_EXECUTABLE
        NAMES appstream-util
        DOC "appstream-util executable"
        REQUIRED
    )
    mark_as_advanced(AppstreamUtil_EXECUTABLE)

    find_program(
        DesktopFileValidate_EXECUTABLE
        NAMES desktop-file-validate
        DOC "desktop-file-validate executable"
        REQUIRED
    )
    mark_as_advanced(DesktopFileValidate_EXECUTABLE)

    set(AppstreamUtil_PARAMETERS "validate")
    if (NOT TESTS_ENABLE_NETWORK)
        list(APPEND AppstreamUtil_PARAMETERS "--nonet")
    endif()
    mark_as_advanced(AppstreamUtil_PARAMETERS)
endif()
