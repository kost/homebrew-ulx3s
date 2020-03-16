class NextpnrIce40 < Formula
  desc "portable FPGA place-and-route tool"
  homepage "https://github.com/YosysHQ/nextpnr"
  head "https://github.com/YosysHQ/nextpnr.git"

  depends_on "cmake"
  depends_on "pkg-config"
  depends_on "eigen" => :build
  depends_on "python"
  depends_on "boost"
  depends_on "boost-python3"
  depends_on "qt5"
  depends_on "icestorm"

  def install
    system "cmake", "-DARCH=ice40", "-DICEBOX_ROOT=#{Formula["icestorm"].opt_share}/icebox", ".", *std_cmake_args, "-DBoost_NO_BOOST_CMAKE=on", "-DBUILD_TESTS=OFF"
    system "make", "install"
  end

end
