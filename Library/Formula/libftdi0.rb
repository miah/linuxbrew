require "formula"

class Libftdi0 < Formula
  desc "Library to talk to FTDI chips"
  homepage "http://www.intra2net.com/en/developer/libftdi"
  url "http://www.intra2net.com/en/developer/libftdi/download/libftdi-0.20.tar.gz"
  sha1 "4bc6ce70c98a170ada303fbd00b8428d8a2c1aa2"

  bottle do
    cellar :any
    revision 1
    sha1 "48a4609d612c41a79a57ceee49b24a119173559f" => :yosemite
    sha1 "92073c13614ddbed4f3d5223105e2d25abe115d9" => :mavericks
    sha1 "39d3653f05b71220ed1977abf6bdb37c0e00fed5" => :mountain_lion
  end

  depends_on "libusb-compat"

  def install
    mkdir "libftdi-build" do
      system "../configure", "--prefix=#{prefix}"
      system "make"
      system "make install"
    end
  end
end
