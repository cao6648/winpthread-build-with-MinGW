
# NOTE: CMake 2.8.6 is required since this is the version used in development.
cmake_minimum_required (VERSION 2.8.6 FATAL_ERROR)

set(WORK_DIR "D:workdir")

if("${CMAKE_C_FLAGS}" MATCHES "-m32")
    set(CMAKE_C_COMPILER "${WORK_DIR}/mingw32/bin/gcc.exe")
    set(CMAKE_CXX_COMPILER "${WORK_DIR}/mingw32/bin/g++.exe")
elseif("${CMAKE_C_FLAGS}" MATCHES "-m64")
    set(CMAKE_C_COMPILER "${WORK_DIR}/mingw64/bin/gcc.exe")
    set(CMAKE_CXX_COMPILER "${WORK_DIR}/mingw64/bin/g++.exe")
endif()

project(winpthread)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)
set(TOP_SRC ${CMAKE_CURRENT_SOURCE_DIR}/src)

set(SOURCE_FILES
    ${TOP_SRC}/barrier.c
    ${TOP_SRC}/clock.c
    ${TOP_SRC}/cond.c
    ${TOP_SRC}/misc.c
    ${TOP_SRC}/mutex.c
    ${TOP_SRC}/nanosleep.c
    ${TOP_SRC}/ref.c
    ${TOP_SRC}/rwlock.c
    ${TOP_SRC}/sched.c
    ${TOP_SRC}/sem.c
    ${TOP_SRC}/spinlock.c
    ${TOP_SRC}/thread.c
)

add_library(winpthread STATIC ${SOURCE_FILES})
