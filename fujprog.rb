class Fujprog < Formula
  desc "FPGA ULX2S / ULX3S JTAG programmer"
  homepage "https://github.com/kost/fujprog"
  head "https://github.com/kost/fujprog.git"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "libftdi"
  depends_on "libusb"
  depends_on "libusb-compat"

  def install
    cd "fujprog--git" do
      system "cmake", ".", *std_cmake_args
      system "make", "install"
    end
  end

end

