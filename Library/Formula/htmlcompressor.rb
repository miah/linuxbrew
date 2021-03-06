require "formula"

class Htmlcompressor < Formula
  desc "Minify HTML or XML"
  homepage "http://code.google.com/p/htmlcompressor/"
  url "https://htmlcompressor.googlecode.com/files/htmlcompressor-1.5.3.jar"
  sha1 "57db73b92499e018b2f2978f1c7aa7b1238c7a39"

  option "with-yuicompressor", "Use YUICompressor for JS/CSS compression"
  option "with-closure-compiler", "Use Closure Compiler for JS optimization"

  deprecated_option "yuicompressor" => "with-yuicompressor"
  deprecated_option "closure-compiler" => "with-closure-compiler"

  depends_on "yuicompressor" => :optional
  depends_on "closure-compiler" => :optional

  def install
    libexec.install "htmlcompressor-#{version}.jar"
    bin.write_jar_script libexec/"htmlcompressor-#{version}.jar", "htmlcompressor"

    if build.with? "yuicompressor"
      yui = Formula["yuicompressor"]
      libexec.install_symlink yui.opt_libexec/"yuicompressor-#{yui.version}.jar"
    end

    if build.with? "closure-compiler"
      libexec.install_symlink Formula["closure-compiler"].opt_libexec/"build/compiler.jar"
    end
  end

  test do
    path = testpath/"index.xml"
    path.write <<-EOS
      <foo>
        <bar /> <!-- -->
      </foo>
    EOS

    output = `#{bin}/htmlcompressor #{path}`.strip
    assert_equal "<foo><bar/></foo>", output
    assert_equal 0, $?.exitstatus
  end
end
