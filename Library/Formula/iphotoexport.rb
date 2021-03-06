require "formula"

class Iphotoexport < Formula
  desc "Export and synchronize iPhoto library to a folder tree"
  homepage "http://code.google.com/p/iphotoexport/"
  url "https://iphotoexport.googlecode.com/files/iphotoexport-1.6.4.zip"
  sha1 "50fa0916cf9689efdfd33cd4680424234b4e9023"

  depends_on "exiftool"

  def install
    unzip_dir = "#{name}-#{version}"
    # Change hardcoded exiftool path
    inreplace "#{unzip_dir}/tilutil/exiftool.py", "/usr/bin/exiftool", "exiftool"

    prefix.install Dir["#{unzip_dir}/*"]
    bin.install_symlink prefix+"iphotoexport.py" => "iphotoexport"
  end
end
