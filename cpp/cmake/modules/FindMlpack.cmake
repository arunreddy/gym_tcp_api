# Try to find Part4 library
# Once done this will define
#  MLPACK_FOUND - if system found Part4 library
#  MLPACK_INCLUDE_DIRS - The Part4 include directories
#  MLPACK_LIBRARIES - The libraries needed to use Part4
#  MLPACK_DEFINITIONS - Compiler switches required for using Part4

set (MLPACK_ROOT_DIR /home/arun/.local/mlpack)
# Uncomment the following line to print which directory CMake is looking in.
MESSAGE(STATUS "MLPACK_ROOT_DIR: " ${MLPACK_ROOT_DIR})

find_path(MLPACK_INCLUDE_DIR
    NAMES mlpack/include
    PATHS ${MLPACK_ROOT_DIR}
    DOC "The mlpack include directory"
)

find_library(MLPACK_LIBRARY 
    NAMES libmlpack.so.2.0 
    PATHS ${MLPACK_ROOT_DIR}/lib
    DOC "The mlpack library"
)

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set LOGGING_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(MLPACK DEFAULT_MSG MLPACK_INCLUDE_DIR MLPACK_LIBRARY)

if (MLPACK_FOUND)
    set(MLPACK_LIBRARIES ${MLPACK_LIBRARY} )
    set(MLPACK_INCLUDE_DIRS ${MLPACK_INCLUDE_DIR} )
    set(MLPACK_DEFINITIONS )
endif()

# Tell cmake GUIs to ignore the "local" variables.
mark_as_advanced(MLPACK_ROOT_DIR MLPACK_INCLUDE_DIR MLPACK_LIBRARY)
