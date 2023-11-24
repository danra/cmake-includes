# When present, use Intel IPP for performance on Windows
if (WIN32) # Can't use MSVC here, as it won't catch Clang on Windows
    find_package(IPP)
    if (IPP_FOUND)
        target_link_libraries(${PROJECT_NAME} PRIVATE IPP::ipps IPP::ippcore IPP::ippi IPP::ippcv)
        # TODO: Also add IPP include directories as PUBLIC
        message("IPP LIBRARIES FOUND")
        target_compile_definitions(${PROJECT_NAME} PRIVATE PAMPLEJUCE_IPP=1)
    else ()
        message("IPP LIBRARIES *NOT* FOUND")
    endif ()
endif ()
