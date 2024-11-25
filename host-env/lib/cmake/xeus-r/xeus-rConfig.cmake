############################################################################
# Copyright (c) 2023, QuantStack
#                                                     
#                                                                          
# Distributed under the terms of the GNU General Public License v3.               
#                                                                          
# The full license is in the file LICENSE, distributed with this software. 
############################################################################

# xeus-r cmake module
# This module sets the following variables in your project::
#
#   xeus-r_FOUND - true if xeus-r was found on the system
#   xeus-r_INCLUDE_DIRS - the directory containing xeus-r headers
#   xeus-r_LIBRARY - the library for dynamic linking
#   xeus-r_STATIC_LIBRARY - the library for static linking


####### Expanded from @PACKAGE_INIT@ by configure_package_config_file() #######
####### Any changes to this file will be overwritten by the next CMake run ####
####### The input file was xeus-rConfig.cmake.in                            ########

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

set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR};${CMAKE_MODULE_PATH}")



include(CMakeFindDependencyMacro)

if (NOT ON)
    find_dependency(xeus-zmq )
endif ()

if (NOT TARGET xeus-r AND NOT TARGET xeus-r-static)
    include("${CMAKE_CURRENT_LIST_DIR}/xeus-rTargets.cmake")

    if (TARGET xeus-r AND TARGET xeus-r-static)
        get_target_property(xeus-r_INCLUDE_DIR xeus-r INTERFACE_INCLUDE_DIRECTORIES)
        get_target_property(xeus-r_LIBRARY xeus-r LOCATION)
        get_target_property(xeus-r_STATIC_LIBRARY xeus-r-static LOCATION)
    elseif (TARGET xeus-r)
        get_target_property(xeus-r_INCLUDE_DIR xeus-r INTERFACE_INCLUDE_DIRECTORIES)
        get_target_property(xeus-r_LIBRARY xeus-r LOCATION)
    elseif (TARGET xeus-r-static)
        get_target_property(xeus-r_INCLUDE_DIR xeus-r-static INTERFACE_INCLUDE_DIRECTORIES)
        get_target_property(xeus-r_STATIC_LIBRARY xeus-r-static LOCATION)
        set(xeus-r_LIBRARY ${xeus-r_STATIC_LIBRARY})
    endif ()
endif ()
