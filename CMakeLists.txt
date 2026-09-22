cmake_minimum_required(VERSION 3.8)
project(dexhand_vendor)

find_package(ament_cmake REQUIRED)

# force install to current package install
set(CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}" CACHE STRING "Install prefix" FORCE)

include(FetchContent)
FetchContent_Declare(
    dexhand_sdk_cpp
    GIT_REPOSITORY  https://github.com/DexRobot/dexhand_sdk_cpp.git
    GIT_TAG         9c59f7b7b52be9447289704d333cd0ec9a618f88
)

FetchContent_MakeAvailable(dexhand_sdk_cpp)

set(DEXHAND_INCLUDE_DIR "${dexhand_sdk_cpp_SOURCE_DIR}/include")
set(DEXHAND_LIB_DIR "${dexhand_sdk_cpp_SOURCE_DIR}/lib/linux/x86_64")

# Install headers
install(
  DIRECTORY "${DEXHAND_INCLUDE_DIR}/"
  DESTINATION include
)

# Install only the libraries that have no system package.
# libserial and libusb come from apt (libserial-dev, libusb-1.0-0-dev).
install(
  DIRECTORY "${DEXHAND_LIB_DIR}/"
  DESTINATION lib
  FILES_MATCHING
    PATTERN "libdexhand.so"
    PATTERN "libusbcanfd.so*"
)

ament_package(
  CONFIG_EXTRAS "cmake/dexhand_vendor-extras.cmake"
)
