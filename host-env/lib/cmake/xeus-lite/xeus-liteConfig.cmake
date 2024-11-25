############################################################################
# Copyright (c) 2016, Johan Mabille, Sylvain Corlay, Martin Renou          #
# Copyright (c) 2016, QuantStack                                           #
#                                                                          #
# Distributed under the terms of the BSD 3-Clause License.                 #
#                                                                          #
# The full license is in the file LICENSE, distributed with this software. #
############################################################################

# xeus cmake module
# This module sets the following variables in your project::
#
#   xeus-lite_FOUND - true if xeus-lite found on the system
#   xeus-lite_INCLUDE_DIR - the directory containing xeus-lite headers
#   xeus-lite_STATIC_LIBRARY - the library for static linking
#   xeus-lite_TS_DIR - the directory containing the TS files for building a jupyterlite kernel


####### Expanded from @PACKAGE_INIT@ by configure_package_config_file() #######
####### Any changes to this file will be overwritten by the next CMake run ####
####### The input file was xeus-liteConfig.cmake.in                            ########

get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../../../" ABSOLUTE)

macro(set_and_check _var _file)
  set(${_var} "${_file}")
  if(NOT EXISTS "${_file}")
    message(FATAL_ERROR "File or directory ${_file} referenced by variable ${_var} does not exist !")
  endif()
endmacro()

macro(check_required_components _NAME)
  foreach(comp ${${_NAME}_FIND_COMPONENTS})
    if(NOT ${_NAME}_${comp}_FOUND)
      if(${_NAME}_FIND_REQUIRED_${comp})
        set(${_NAME}_FOUND FALSE)
      endif()
    endif()
  endforeach()
endmacro()

####################################################################################

set(xeus-lite_TS_DIR ${PACKAGE_PREFIX_DIR}/)
set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR};${CMAKE_MODULE_PATH}")



include(CMakeFindDependencyMacro)
find_dependency(xeus 5.0.0)

if(NOT TARGET xeus-lite)
    include("${CMAKE_CURRENT_LIST_DIR}/xeus-liteTargets.cmake")

    if (TARGET xeus-lite)
        get_target_property(xeus-lite_INCLUDE_DIR xeus-lite INTERFACE_INCLUDE_DIRECTORIES)
        get_target_property(xeus-lite_STATIC_LIBRARY xeus-lite LOCATION)
        set(xeus-lite_LIBRARY ${xeus-lite_STATIC_LIBRARY})
    endif ()
endif()
