class Galfit < Formula
  homepage "http://users.obs.carnegiescience.edu/peng/work/galfit/galfit.html"
  version "3.0.5"

  depends_on :macos => :leopard

  if MacOS.version == :mavericks
    url "http://users.obs.carnegiescience.edu/peng/work/galfit/galfit3-mavericks.tar.gz"
    sha1 "2cf6fad043efd509b71596712e4f0605ba5622db"
  else
    url "http://users.obs.carnegiescience.edu/peng/work/galfit/galfit3-leopard+.tar.gz"
    sha256 "97dae1d6500d42fa9cb27faca15286350b69e703eaecfdb6bf89c33f85a03d5d"
  end

  resource "example" do
    url "http://users.obs.carnegiescience.edu/peng/work/galfit/galfit-ex.tar.gz"
    sha256 "3761cf4247b076a4aa2842c4c8d1f4d99871ec4ef31f39145c28102aaadc0d9a"
  end

  def install
    bin.install "galfit"
    pkgshare.install resource("example")
  end

  def caveats; <<-EOS.undent
    The documentation and examples are installed to
    #{HOMEBREW_PREFIX}/share/galfit
    EOS
  end

  test do
    cp Dir[share/"galfit/EXAMPLE/*"], testpath
    system "galfit", "galfit.feedme"
  end
end
