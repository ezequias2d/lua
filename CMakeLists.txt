cmake_minimum_required(VERSION 3.5.0)
project(lua VERSION 5.4.6 LANGUAGES C)

set(LUA_SOURCES
    lapi.c
    lauxlib.c
    lbaselib.c
    lcode.c
    lcorolib.c
    lctype.c
    ldblib.c
    ldebug.c
    ldo.c
    ldump.c
    lfunc.c
    lgc.c
    linit.c
    liolib.c
    llex.c
    lmathlib.c
    lmem.c
    loadlib.c
    lobject.c
    lopcodes.c
    loslib.c
    lparser.c
    lstate.c
    lstring.c
    lstrlib.c
    ltable.c
    ltablib.c
    ltests.c
    ltm.c
    lundump.c
    lutf8lib.c
    lvm.c
    lzio.c
)

set(LUA_PUBLIC_HEADERS
    lauxlib.h
    lua.h
    luaconf.h
    lualib.h
)

set(CMAKE_C_STANDARD 99)

source_group("Source Files" FILES ${LUA_SOURCES})

# Option for building as a shared library (default: ON)
option(BUILD_SHARED_LIBS "Build Lua as a shared library" ON)

add_library(lua ${LUA_SOURCES})
set_target_properties(lua PROPERTIES
    POSITION_INDEPENDENT_CODE ON)
    
target_include_directories(lua PUBLIC ${LUA_PUBLIC_HEADERS})

# Linker options
if(APPLE)
    target_link_libraries(lua PRIVATE "-lm")
elseif(UNIX)
    target_link_libraries(lua PRIVATE m)
endif()
