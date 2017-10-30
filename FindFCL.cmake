# Find FCL
#
# This sets the following variables:
# FCL_FOUND
# FCL_INCLUDE_DIRS
# FCL_LIBRARIES
# FCL_DEFINITIONS
# FCL_VERSION

find_package(PkgConfig)

pkg_check_modules(PC_FCL REQUIRED fcl>=0.5)

set(FCL_DEFINITIONS ${PC_FCL_CFLAGS_OTHER})
set(FCL_INCLUDE_DIRS ${PC_FCL_INCLUDE_DIRS})
set(FCL_LIBRARIES ${PC_FCL_LIBRARIES})
set(FCL_VERSION ${PC_FCL_VERSION})
include(FindPackageHandleStandardArgs)
# if all listed variables are TRUE
find_package_handle_standard_args(FCL DEFAULT_MSG
  FCL_LIBRARIES FCL_INCLUDE_DIRS)
mark_as_advanced(FCL_INCLUDE_DIRS FCL_LIBRARIES)

if(${FCL_FOUND})
  message(STATUS "Found FCL version: " ${FCL_VERSION} " installed in: " ${PC_FCL_PREFIX})
else()
  message(SEND_ERROR "Could not find FCL")
endif()