add_rules("mode.debug", "mode.release")
set_languages("c99", "cxx11")

if is_os("windows") then
    set_config("arch", "x86")
    add_cxflags("/EHsc", {force = true})
    if is_mode("release") then
        add_cxflags("-MD", {force = true})
    else
        set_symbols("debug")
        set_config("vs_runtime", "MDd")
        add_cxflags("-MDd", {force = true})
    end
else
    set_config("arch", "x86_64")
    add_cxflags("-MD", {force = true})
    set_symbols("debug")
    set_optimize("none")
    set_symbols("hidden")
end

add_requires("conan::libcurl/7.80.0", {alias = "curl"})
add_requires("conan::boost/1.69.0", {alias = "boost"})
add_requires("conan::hiredis/1.0.2", {alias = "hiredis"})
add_requires("conan::rapidjson/cci.20211112", {alias = "rapidjson"})

package("sundown")
    add_includedirs("deps")

target("CxxCms")
    set_kind("binary")

    add_includedirs("deps")
    add_includedirs("deps/crow/include")
    add_files("deps/oauth/*.cpp", "deps/restclient/*.cpp", "deps/sundown/*.c")
    add_includedirs("deps/redis3m/include")
    add_files("deps/redis3m/src/*.cpp", "deps/redis3m/src/utils/*.cpp", "deps/redis3m/src/patterns/*.cpp");
    add_files("app/*.cpp")
    


    add_packages("curl", "boost", "hiredis", "rapidjson")
    add_syslinks("pthread")
    add_defines("NO_BOOST")