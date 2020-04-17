# Autogenerated wrapper script for Readline_jll for i686-w64-mingw32
export libreadline, libhistory

using Ncurses_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "PATH"

# Relative path to `libreadline`
const libreadline_splitpath = ["bin", "libreadline8.dll"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libreadline_path = ""

# libreadline-specific global declaration
# This will be filled out by __init__()
libreadline_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libreadline = "libreadline8.dll"


# Relative path to `libhistory`
const libhistory_splitpath = ["bin", "libhistory8.dll"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libhistory_path = ""

# libhistory-specific global declaration
# This will be filled out by __init__()
libhistory_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libhistory = "libhistory8.dll"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"Readline")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [Sys.BINDIR, joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (Ncurses_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (Ncurses_jll.LIBPATH_list,))

    global libreadline_path = normpath(joinpath(artifact_dir, libreadline_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libreadline_handle = dlopen(libreadline_path)
    push!(LIBPATH_list, dirname(libreadline_path))

    global libhistory_path = normpath(joinpath(artifact_dir, libhistory_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libhistory_handle = dlopen(libhistory_path)
    push!(LIBPATH_list, dirname(libhistory_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ';')
    global LIBPATH = join(LIBPATH_list, ';')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

