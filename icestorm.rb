class Icestorm < Formula
  desc "tools for documenting and working with iCE40 FPGA files"
  homepage "https://github.com/cliffordwolf/icestorm"
  head "https://github.com/cliffordwolf/icestorm.git"

  depends_on "pkg-config"
  depends_on "libftdi"
  depends_on "python"
  depends_on "icestorm"

  def install
    system "make", "install", "PREFIX=#{prefix}"

    # FIXME: Icestorm installs a set of utility functions and database definitions into /bin/,
    # as it lacks e.g. a setup.py for its module. This should be correced in icestorm, but I'm leaving it
    # for now (I should fix this upstream).
  end

end
