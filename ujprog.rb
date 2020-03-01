class Ujprog < Formula
  desc "ULX2S / ULX3S FPGA JTAG programmer"
  homepage "https://github.com/f32c/tools"
  head "https://github.com/f32c/tools.git"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "libftdi"
  depends_on "libusb"
  depends_on "libusb-compat"

  patch :DATA

  def install
    cd "ujprog" do
      system "cmake", ".", *std_cmake_args
      system "make", "install"
    end
  end

end


__END__
diff --git a/ujprog/CMakeLists.txt b/ujprog/CMakeLists.txt
new file mode 100644
index 0000000..bbe5969
--- /dev/null
+++ b/ujprog/CMakeLists.txt
@@ -0,0 +1,58 @@
+cmake_minimum_required(VERSION 3.10)
+
+# set the project name and version
+project(ujprog VERSION 1.0)
+
+# control where the static and shared libraries are built so that on windows
+# we don't need to tinker with the path to run the executable
+set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}")
+set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}")
+set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}")
+
+option(BUILD_STATIC "Build completely static binary" OFF)
+option(BUILD_STATICLIB "Build binary with non default static binaries" OFF)
+
+if (BUILD_STATIC)
+	set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -static")
+	set(CMAKE_FIND_LIBRARY_SUFFIXES ".a")
+	find_library(LIBFTDISTATIC libftdi.a REQUIRED)
+	find_library(LIBUSB0STATIC libusb.a REQUIRED)
+endif()
+if (BUILD_STATICLIB)
+	if (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
+		set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -framework CoreFoundation -framework IOKit")
+		find_library(LIBFTDISTATIC libftdi1.a REQUIRED)
+		find_library(LIBUSB0STATIC libusb-1.0.a REQUIRED)
+	else()
+		find_library(LIBFTDISTATIC libftdi.a REQUIRED)
+		find_library(LIBUSB0STATIC libusb.a REQUIRED)
+	endif()
+	# set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -static-libgcc")
+endif()
+find_package(LibFTDI1 CONFIG REQUIRED)
+
+link_directories(/usr/local/lib)
+
+# configure a header file to pass the version number only
+configure_file(ujprog.h.in ujprog.h)
+
+# add the executable
+add_executable(ujprog ujprog.c)
+target_include_directories(ujprog PRIVATE ${LIBFTDI_INCLUDE_DIR})
+if (BUILD_STATICLIB)
+	set(CMAKE_FIND_LIBRARY_SUFFIXES ".a")
+	# set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -static-libgcc")
+	set_target_properties(ujprog PROPERTIES LINK_SEARCH_START_STATIC 1)
+	set_target_properties(ujprog PROPERTIES LINK_SEARCH_END_STATIC 1)
+	target_link_libraries(ujprog PUBLIC ${LIBFTDISTATIC} ${LIBUSB0STATIC})
+else()
+	if (BUILD_STATIC)
+		target_link_libraries(ujprog PUBLIC ${LIBFTDISTATIC} ${LIBUSB0STATIC})
+	else()
+		target_link_libraries(ujprog PUBLIC ${LIBFTDI_LIBRARY} usb)
+	endif()
+endif()
+
+# install
+install(TARGETS ujprog DESTINATION bin)
+
diff --git a/ujprog/README.md b/ujprog/README.md
index a6858e5..79214a6 100644
--- a/ujprog/README.md
+++ b/ujprog/README.md
@@ -104,3 +104,16 @@ There can be many problems, I don't know what to do
 one of the issues is that ujprog executable may needs
 some dynamic linked library of specific version like libusb
 
+*** CMake ***
+
+It is standard CMake procedure:
+    # mkdir build
+    # cmake ..
+    # make
+    # make install
+
+You can also pass optional parameters:
+
+    # cmake -DBUILD_STATIC=ON -DLIBFTDISTATIC=/opt/libftdi/lib/libftdi.a -DLIBUSB0STATIC=/opt/libusb0/lib/libusb.a ..
+    # make install/strip
+
diff --git a/ujprog/ujprog.h.in b/ujprog/ujprog.h.in
new file mode 100644
index 0000000..6a198e6
--- /dev/null
+++ b/ujprog/ujprog.h.in
@@ -0,0 +1,3 @@
+#define UJPROG_VERSION_MAJOR @ujprog_VERSION_MAJOR@
+#define UJPROG_VERSION_MINOR @ujprog_VERSION_MINOR@
+
