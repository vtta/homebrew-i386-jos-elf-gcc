class I386JosElfGdb < Formula
  homepage "http://pdos.csail.mit.edu/6.828/2014/tools.html"
  url "http://ftpmirror.gnu.org/gdb/gdb-7.3.1.tar.bz2"
  sha256 "6d7bff716fde98d03866a1b747c0929ee7dba49bca13e01d975e0b0fa9b33a28"

  bottle do
    root_url "https://github.com/vtta/homebrew-i386-jos-elf-gcc/releases/download/0.0.1"
    sha256 "d446e575310af8edb8972400f40d9add94eed05a12707f34ab472fc00655ff83" => :catalina
  end

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--target=i386-jos-elf",
                          "--program-prefix=i386-jos-elf-",
                          "--disable-nls",
                          "--disable-werror"
    system "make", "all"
    system "make", "install"
    # avoid conflict with binutil
    if Formula["i386-jos-elf-binutils"].installed?
      rm_r share/"info"
      rm_r lib
    end
  end

  test do
    system "#{bin}/i386-jos-elf-gdb -v"
  end
end
