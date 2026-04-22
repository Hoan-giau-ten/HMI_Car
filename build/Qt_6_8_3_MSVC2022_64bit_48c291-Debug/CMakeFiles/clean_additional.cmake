# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\appHMI_car_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appHMI_car_autogen.dir\\ParseCache.txt"
  "appHMI_car_autogen"
  )
endif()
