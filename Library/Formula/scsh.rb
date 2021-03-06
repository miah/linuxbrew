require "formula"

class Scsh < Formula
  desc "Scheme shell"
  homepage "http://www.scsh.net/"
  url "http://ftp.scsh.net/pub/scsh/0.6/scsh-0.6.7.tar.gz"
  sha1 "a1eaf0d0593e14914824898a0c3ec166429affd7"

  head do
    url "https://github.com/scheme/scsh.git"

    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "scheme48"
  end

  conflicts_with "scheme48", :because => "both install include/scheme48.h"

  def install
    if build.head?
      system "autoreconf"
    else
      # will not build 64-bit
      ENV.m32
    end

    # build system is not parallel-safe
    ENV.deparallelize
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--infodir=#{info}",
                          "--mandir=#{man}"
    system "make install"
  end
end
