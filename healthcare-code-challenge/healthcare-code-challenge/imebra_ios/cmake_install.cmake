# Install script for directory: /Users/florian/Downloads/imebra_5_0_1_1

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/libimebra" TYPE FILE PERMISSIONS OWNER_WRITE OWNER_READ GROUP_READ WORLD_READ FILES "/Users/florian/Documents/Programming/healthcare-code-challenge/imebra_ios/copyright")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/Users/florian/Documents/Programming/healthcare-code-challenge/imebra_ios/libimebra.a")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libimebra.a" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libimebra.a")
    execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libimebra.a")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xImebra include filesx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/imebra" TYPE FILE FILES
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/VOIDescription.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/VOILUT.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/acse.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/age.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/baseStreamInput.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/baseStreamOutput.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/baseUidGenerator.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/codecFactory.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/colorTransformsFactory.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/dataSet.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/date.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/definitions.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/dicomDefinitions.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/dicomDictionary.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/dicomDir.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/dicomDirEntry.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/dimse.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/drawBitmap.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/exceptions.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/fileStreamInput.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/fileStreamOutput.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/image.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/imebra.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/lut.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/memory.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/memoryPool.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/memoryStreamInput.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/memoryStreamOutput.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/modalityVOILUT.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/mutableMemory.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/overlay.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/patientName.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/pipeStream.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/randomUidGenerator.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/readingDataHandler.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/readingDataHandlerNumeric.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/serialNumberUidGenerator.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/streamReader.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/streamWriter.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/tag.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/tagId.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/tcpAddress.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/tcpListener.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/tcpStream.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/transform.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/transformHighBit.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/transformsChain.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/uidGeneratorFactory.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/uidsEnumeration.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/writingDataHandler.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/library/include/imebra/writingDataHandlerNumeric.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xImebra objc include filesx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/imebraobjc" TYPE FILE FILES
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_VOIDescription.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_VOILUT.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_acse.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_baseStreamInput.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_baseStreamOutput.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_baseUidGenerator.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_codecFactory.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_colorTransformsFactory.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_dataset.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_dateAge.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_dicomDictionary.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_dicomDir.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_dimse.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_drawBitmap.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_exceptions.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_fileStreamInput.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_fileStreamOutput.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_image.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_lut.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_macros.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_memoryPool.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_memoryStreamInput.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_memoryStreamOutput.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_modalityVOILUT.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_overlay.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_patientName.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_pipe.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_randomUidGenerator.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_readMemory.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_readWriteMemory.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_readingDataHandler.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_readingDataHandlerNumeric.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_serialNumberUidGenerator.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_streamReader.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_streamWriter.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_swift.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_tag.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_tagId.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_tcpAddress.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_tcpListener.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_tcpStream.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_transform.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_transformHighBit.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_transformsChain.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_uidGeneratorFactory.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_writingDataHandler.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/imebra_writingDataHandlerNumeric.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/tagsEnumeration.h"
    "/Users/florian/Downloads/imebra_5_0_1_1/wrappers/objectivec/include/imebraobjc/uidsEnumeration.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/imebra/cmake/imebraConfig.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/imebra/cmake/imebraConfig.cmake"
         "/Users/florian/Documents/Programming/healthcare-code-challenge/imebra_ios/CMakeFiles/Export/share/imebra/cmake/imebraConfig.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/imebra/cmake/imebraConfig-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/imebra/cmake/imebraConfig.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/imebra/cmake" TYPE FILE FILES "/Users/florian/Documents/Programming/healthcare-code-challenge/imebra_ios/CMakeFiles/Export/share/imebra/cmake/imebraConfig.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/imebra/cmake" TYPE FILE FILES "/Users/florian/Documents/Programming/healthcare-code-challenge/imebra_ios/CMakeFiles/Export/share/imebra/cmake/imebraConfig-noconfig.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/Users/florian/Documents/Programming/healthcare-code-challenge/imebra_ios/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
