add_library(jianmu-src STATIC
    sylib.c
    sylib.h
)
install(
    TARGETS jianmu-src
    ARCHIVE DESTINATION lib
)
