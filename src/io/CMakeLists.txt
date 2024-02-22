add_library(cminus_io 
io.c
io.h)

install(
    TARGETS cminus_io
    ARCHIVE DESTINATION lib
)
