-- option("openssl")
--     set_showmenu(true)
--     before_check(function (option)
--         import("lib.detect.find_package")
--         option:add(find_package("openssl"))
--     end)

add_requires("conan::libcurl/7.80.0", {alias = "curl"})

target("CxxCms")
    set_kind("binary")
    add_includedirs("deps")
    add_includedirs("deps/crow/include", "deps/crow/include/crow")
    add_files("deps/hiredis/*.c", "deps/oauth/*.cpp", "deps/restclient/*.cpp", "deps/sundown/*.c")
    add_includedirs("deps/redis3m/include")
    add_files("deps/redis3m/src/*.cpp", "deps/redis3m/src/utils/*.cpp", "deps/redis3m/src/patterns/*.cpp");

    
    add_files("app/*.cpp")

    add_includedirs("/home/kench/workspace/boost_1_69_0/include")
    add_linkdirs("/home/kench/workspace/boost_1_69_0/build/debug/lib")
    add_links("boost_system", "boost_thread", "boost_date_time", "boost_filesystem", "boost_regex", "boost_random")

    add_includedirs("/home/kench/miniconda3/include")
    add_linkdirs("/home/kench/workspace/boost_1_69_0/build/debug/lib")
    add_links("boost_system", "boost_thread", "boost_date_time", "boost_filesystem", "boost_regex", "boost_random")

    set_symbols("debug")
    add_packages("curl")
    -- on_load(function (target)
    --     target:add(find_packages("openssl", "curl"))
    -- end)
    add_syslinks("pthread")
