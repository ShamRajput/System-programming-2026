add_library(gdb-help-lib SHARED 
    src/gdb.cxx
)

target_include_directories(gdb-help-lib 
    PUBLIC 
       PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/inc
    PRIVATE 
        ${CMAKE_CURRENT_SOURCE_DIR}/src
)


set_target_properties(gdb-help-lib PROPERTIES 
    INSTALL_RPATH "$ORIGIN"
)