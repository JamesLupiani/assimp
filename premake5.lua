solution "AssImp"
    configurations { "Debug", "Release" }
    platforms { "x32", "x64" }
    location "build"

    configuration "Debug"
        defines { "_DEBUG" }
        flags { "Symbols" }

    configuration "Release"
        defines { "NDEBUG" }
        flags {
            "NoFramePointer",
            "Optimize"
        }

    configuration "windows"
        defines {
            "WIN32",
            "_CRT_SECURE_NO_WARNINGS",
            "_SCL_SECURE_NO_WARNINGS",
        }

        -- These target suffixes are for importing into assimp-net
        configuration "x32"
            targetsuffix "32"

        configuration "x64"
            targetsuffix "64"


    project "Assimp"
        uuid "596BC821-1892-4A69-914E-BDF88ADF48B3"
        location "build"
        kind "SharedLib"
        language "C++"
        includedirs {
            "code",
            "include",
            os.getenv("BOOST_ROOT"),
        }
        links {
            "clipper",
            "ConvertUTF",
            "irrXML",
            "poly2tri",
            "unzip",
            "zlib",
        }
        -- Not quite working yet...
        --pchsource "AssimpPCH.cpp"
        --pchheader "AssimpPCH.h"

        files {
            "code/**.h",
            "code/**.cpp",
        }

        defines { "ASSIMP_BUILD_DLL_EXPORT" }


    project "clipper"
        uuid "C26CEE12-44AF-412F-9419-7A85CCE258A3"
        location "build"
        kind "StaticLib"
        language "C++"
        includedirs "contrib/clipper"
        files "contrib/clipper/*.cpp"

    project "ConvertUTF"
        uuid "959A258F-7EE8-417C-B69D-EAE616DDC5FA"
        location "build"
        kind "StaticLib"
        language "C"
        includedirs "contrib/ConvertUTF"
        files "contrib/ConvertUTF/*.c"

    project "irrXML"
        uuid "32B15695-B8AA-4E4B-BEAB-EC5F7FF90374"
        location "build"
        kind "StaticLib"
        language "C++"
        includedirs { "contrib/irrXML", os.getenv("BOOST_ROOT") }
        files "contrib/irrXML/*.cpp"

    project "poly2tri"
        uuid "5EAA95B2-8ADC-4B67-B761-C57DEED45B3F"
        location "build"
        kind "StaticLib"
        language "C++"
        includedirs "contrib/poly2tri/poly2tri"
        files "contrib/poly2tri/poly2tri/**.cc"

    project "unzip"
        uuid "6FA321B0-4898-4F58-8A8F-D8A55FFB9BC2"
        location "build"
        kind "StaticLib"
        language "C"
        includedirs "contrib/unzip"
        files "contrib/unzip/*.c"

    project "zlib"
        uuid "68674BEB-A303-49C6-9C23-09241C88A9AD"
        location "build"
        kind "StaticLib"
        language "C"
        includedirs "contrib/zlib"
        files "contrib/zlib/*.c"

