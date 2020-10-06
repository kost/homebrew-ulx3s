class NextpnrTrellis < Formula
  desc "portable FPGA place-and-route tool"
  homepage "https://github.com/YosysHQ/nextpnr"
  head "https://github.com/YosysHQ/nextpnr.git"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "eigen" => :build
  depends_on "python@3.8"
  depends_on "boost"
  depends_on "boost-python3"
  depends_on "qt5"
  depends_on "project-trellis"

  def install
    system "cmake", "-DARCH=ecp5", \
       "-DTRELLIS_LIBDIR=#{Formula['project-trellis'].prefix.to_s+'-'+Formula['project-trellis'].any_installed_version.version.commit.to_s+"/lib/trellis"}", \
       "-DTRELLIS_INSTALL_PREFIX=#{HOMEBREW_PREFIX}", \
       ".", *std_cmake_args, "-DBoost_NO_BOOST_CMAKE=on", "-DBUILD_TESTS=OFF"
    system "make", "install"
  end

end
