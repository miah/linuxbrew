require "formula"

class Libelf < Formula
  desc "ELF object file access library"
  homepage "http://www.mr511.de/software/"
  url "http://www.mr511.de/software/libelf-0.8.13.tar.gz"
  sha1 "c1d6ac5f182d19dd685c4dfd74eedbfe3992425d"

  bottle do
    cellar :any
    revision 1
    sha1 "58ec51e663fa6375026ff609c1c189f870559d0c" => :yosemite
    sha1 "0eeb37ce876f79cc0261cfd9c6ec9cfd8bc5c28b" => :mavericks
    sha1 "a62370107719d8a92b0226335cd9dd73686ddd4f" => :mountain_lion
  end

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--disable-compat"
    # Use separate steps; there is a race in the Makefile.
    system "make"
    system "make install"
  end
end
