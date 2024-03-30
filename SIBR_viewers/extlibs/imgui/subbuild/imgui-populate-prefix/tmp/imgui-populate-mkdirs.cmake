# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/sugar/submodules/gaussian-splatting-docker/SIBR_viewers/extlibs/imgui/imgui"
  "/sugar/submodules/gaussian-splatting-docker/SIBR_viewers/extlibs/imgui/build"
  "/sugar/submodules/gaussian-splatting-docker/SIBR_viewers/extlibs/imgui/subbuild/imgui-populate-prefix"
  "/sugar/submodules/gaussian-splatting-docker/SIBR_viewers/extlibs/imgui/subbuild/imgui-populate-prefix/tmp"
  "/sugar/submodules/gaussian-splatting-docker/SIBR_viewers/extlibs/imgui/subbuild/imgui-populate-prefix/src/imgui-populate-stamp"
  "/sugar/submodules/gaussian-splatting-docker/SIBR_viewers/extlibs/imgui/subbuild/imgui-populate-prefix/src"
  "/sugar/submodules/gaussian-splatting-docker/SIBR_viewers/extlibs/imgui/subbuild/imgui-populate-prefix/src/imgui-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/sugar/submodules/gaussian-splatting-docker/SIBR_viewers/extlibs/imgui/subbuild/imgui-populate-prefix/src/imgui-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/sugar/submodules/gaussian-splatting-docker/SIBR_viewers/extlibs/imgui/subbuild/imgui-populate-prefix/src/imgui-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
