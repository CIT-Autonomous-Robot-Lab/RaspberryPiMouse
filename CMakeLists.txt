cmake_minimum_required(VERSION 3.8)
project(raspberry_pi_mouse)
find_package(ament_cmake_auto REQUIRED)
ament_auto_find_build_dependencies()
ament_auto_package(
  INSTALL_TO_SHARE
  50-rtmouse.rules
  lib
  src
  utils
)