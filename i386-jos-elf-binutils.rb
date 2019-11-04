class I386JosElfBinutils < Formula
  homepage "http://pdos.csail.mit.edu/6.828/2014/tools.html"
  url "http://ftpmirror.gnu.org/binutils/binutils-2.21.1.tar.bz2"
  sha256 "cdecfa69f02aa7b05fbcdf678e33137151f361313b2f3e48aba925f64eabf654"

  bottle do
    root_url "https://github.com/vtta/homebrew-i386-jos-elf-gcc/releases/download/0.0.1"
    sha256 "888a8fdb37c0cda9b39c0e946c758a8a77c02c5fce5d8cc6839718359b9fc98c" => :catalina
  end

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--target=i386-jos-elf",
                          "--disable-werror",
                          "--disable-nls"
    system "make"
    system "make", "install"
    # avoid conflict with gdb
    if Formula["i386-jos-elf-gdb"].installed?
      rm_r share/"info"
      rm_r lib
    end
  end

  test do
    system "#{bin}/i386-jos-elf-objdump -i"
  end
end
