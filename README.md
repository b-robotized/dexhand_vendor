# dexhand21s vendpr

- Upstream: [dexhand_sdk_cpp](https://github.com/DexRobot/dexhand_sdk_cpp.git)

## Example usage:

### `package.xml`

```
<?xml version="1.0"?>
<?xml-model href="http://download.ros.org/schema/package_format3.xsd" schematypens="http://www.w3.org/2001/XMLSchema"?>
<package format="3">
  <name>dexhand_test</name>
  <version>0.0.0</version>
...

  <depend>dexhand_vendor</depend> <!-- ADD THIS --> 
...

  <export>
    <build_type>ament_cmake</build_type>
  </export>
</package>
```

### `CmakeLists.txt`

```
...
find_package(dexhand_vendor REQUIRED)

...

target_include_directories(
  ${PROJECT_NAME}
  PUBLIC
  include
  ${dexhand_vendor_INCLUDE_DIRS}
)

# link against required libs (canfd & dexhand)
target_link_libraries(${PROJECT_NAME} PUBLIC
  ...
  ${dexhand_vendor_LIBRARIES}
  serial
)

...

ament_package()
```

### `.hpp` includes

```
#include "DexHand.h"
```
