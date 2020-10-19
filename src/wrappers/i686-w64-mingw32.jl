# Autogenerated wrapper script for Readline_jll for i686-w64-mingw32
export libhistory, libreadline

using Ncurses_jll
JLLWrappers.@generate_wrapper_header("Readline")
JLLWrappers.@declare_library_product(libhistory, "libhistory8.dll")
JLLWrappers.@declare_library_product(libreadline, "libreadline8.dll")
function __init__()
    JLLWrappers.@generate_init_header(Ncurses_jll)
    JLLWrappers.@init_library_product(
        libhistory,
        "bin\\libhistory8.dll",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_library_product(
        libreadline,
        "bin\\libreadline8.dll",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
