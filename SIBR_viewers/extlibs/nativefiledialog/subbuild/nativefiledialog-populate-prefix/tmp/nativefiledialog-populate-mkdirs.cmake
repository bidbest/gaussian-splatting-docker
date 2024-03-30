# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/sugar/submodules/gaussian-splatting-docker/SIBR_viewers/extlibs/nativefiledialog/nativefiledialog"
  "/sugar/submodules/gaussian-splatting-docker/SIBR_viewers/extlibs/nativefiledialog/build"
  "/sugar/submodules/gaussian-splatting-docker/SIBR_viewers/extlibs/nativefiledialog/subbuild/nativefiledialog-populate-prefix"
  "/sugar/submodules/gaussian-splatting-docker/SIBR_viewers/extlibs/nativefiledialog/subbuild/nativefiledialog-populate-prefix/tmp"
  "/sugar/submodules/gaussian-splatting-docker/SIBR_viewers/extlibs/nativefiledialog/subbuild/nativefiledialog-populate-prefix/src/nativefiledialog-populate-stamp"
  "/sugar/submodules/gaussian-splatting-docker/SIBR_viewers/extlibs/nativefiledialog/subbuild/nativefiledialog-populate-prefix/src"
  "/sugar/submodules/gaussian-splatting-docker/SIBR_viewers/extlibs/nativefiledialog/subbuild/nativefiledialog-populate-prefix/src/nativefiledialog-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/sugar/submodules/gaussian-splatting-docker/SIBR_viewers/extlibs/nativefiledialog/subbuild/nativefiledialog-populate-prefix/src/nativefiledialog-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/sugar/submodules/gaussian-splatting-docker/SIBR_viewers/extlibs/nativefiledialog/subbuild/nativefiledialog-populate-prefix/src/nativefiledialog-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
