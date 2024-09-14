#!/bin/bash

stuart_setup -c Platforms/LGG4Pkg/PlatformBuild.py TOOL_CHAIN_TAG=CLANG38
stuart_update -c Platforms/LGG4Pkg/PlatformBuild.py TOOL_CHAIN_TAG=CLANG38
stuart_build -c Platforms/LGG4Pkg/PlatformBuild.py TOOL_CHAIN_TAG=CLANG38