set(dexhand_vendor_INCLUDE_DIRS "${dexhand_vendor_DIR}/../../../include")
set(dexhand_vendor_LIBRARY_DIRS "${dexhand_vendor_DIR}/../../../lib")

# Find all installed required libraries for dexhand
set(dexhand_vendor_LIBRARIES
  "${dexhand_vendor_LIBRARY_DIRS}/libdexhand.so"
  "${dexhand_vendor_LIBRARY_DIRS}/libusbcanfd.so.1.0.8"
)

list(APPEND CMAKE_INSTALL_RPATH "${dexhand_vendor_LIBRARY_DIRS}")