require "formula"

class Libcmph < Formula
  desc "C minimal perfect hashing library"
  homepage "http://cmph.sourceforge.net"
  url "https://downloads.sourceforge.net/project/cmph/cmph/cmph-2.0.tar.gz"
  sha1 "eabdd4cd9f9bb2fed6773caac8d91638ad2d02b7"

  bottle do
    cellar :any
    revision 1
    sha1 "f85df680877127051920003e29e9676e30322157" => :yosemite
    sha1 "84d44f39e19ebd4e921a11fb81be175935e2b36f" => :mavericks
    sha1 "10c0d6dea19a512b4ff02148bf1f6f60e346c417" => :mountain_lion
  end

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end
