class Openfpgaloader < Formula
  desc "Universal utility for programming FPGA"
  homepage "https://github.com/trabucayre/openFPGALoader"
  head "https://github.com/trabucayre/openFPGALoader"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "libftdi"
  depends_on "libusb"
  depends_on "argp-standalone"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

end


