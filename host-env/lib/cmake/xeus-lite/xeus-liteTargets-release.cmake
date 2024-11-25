#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "xeus-lite" for configuration "Release"
set_property(TARGET xeus-lite APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(xeus-lite PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libxeus-lite.a"
  )

list(APPEND _cmake_import_check_targets xeus-lite )
list(APPEND _cmake_import_check_files_for_xeus-lite "${_IMPORT_PREFIX}/lib/libxeus-lite.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
