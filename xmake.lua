
add_rules("mode.debug", "mode.release")
set_config("vs_runtime", "MD")
set_config("shared", "true")

add_requires("conan::libcurl/7.80.0", {alias = "curl"})
add_requires("conan::boost/1.69.0", {alias = "boost"})
add_requires("conan::hiredis/1.0.2", {alias = "hiredis"})
add_requires("conan::rapidjson/cci.20211112", {alias = "rapidjson"})


target("CxxCms")
    set_kind("binary")
    add_includedirs("deps")
    add_includedirs("deps/crow/include", "deps/crow/include/crow")
    add_files("deps/oauth/*.cpp", "deps/restclient/*.cpp", "deps/sundown/*.c")
    add_includedirs("deps/redis3m/include")
    add_files("deps/redis3m/src/*.cpp", "deps/redis3m/src/utils/*.cpp", "deps/redis3m/src/patterns/*.cpp");
    add_files("app/*.cpp")

    set_symbols("debug")
    add_packages("curl", "boost", "hiredis", "rapidjson")
    add_syslinks("pthread")
