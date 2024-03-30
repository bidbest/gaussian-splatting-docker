# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/sugar/submodules/gaussian-splatting-docker/SIBR_viewers/extlibs/CudaRasterizer/CudaRasterizer"
  "/sugar/submodules/gaussian-splatting-docker/SIBR_viewers/extlibs/CudaRasterizer/build"
  "/sugar/submodules/gaussian-splatting-docker/SIBR_viewers/extlibs/CudaRasterizer/subbuild/cudarasterizer-populate-prefix"
  "/sugar/submodules/gaussian-splatting-docker/SIBR_viewers/extlibs/CudaRasterizer/subbuild/cudarasterizer-populate-prefix/tmp"
  "/sugar/submodules/gaussian-splatting-docker/SIBR_viewers/extlibs/CudaRasterizer/subbuild/cudarasterizer-populate-prefix/src/cudarasterizer-populate-stamp"
  "/sugar/submodules/gaussian-splatting-docker/SIBR_viewers/extlibs/CudaRasterizer/subbuild/cudarasterizer-populate-prefix/src"
  "/sugar/submodules/gaussian-splatting-docker/SIBR_viewers/extlibs/CudaRasterizer/subbuild/cudarasterizer-populate-prefix/src/cudarasterizer-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/sugar/submodules/gaussian-splatting-docker/SIBR_viewers/extlibs/CudaRasterizer/subbuild/cudarasterizer-populate-prefix/src/cudarasterizer-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/sugar/submodules/gaussian-splatting-docker/SIBR_viewers/extlibs/CudaRasterizer/subbuild/cudarasterizer-populate-prefix/src/cudarasterizer-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
