require 'formula'

class Sdl2Image < Formula
  homepage 'http://www.libsdl.org/projects/SDL_image'
  url 'http://www.libsdl.org/projects/SDL_image/release/SDL2_image-2.0.0.tar.gz'
  sha1 '20b1b0db9dd540d6d5e40c7da8a39c6a81248865'

  depends_on 'sdl2'

  option :universal

  def install
    ENV.universal_binary if build.universal?
    inreplace 'SDL2_image.pc.in', '@prefix@', HOMEBREW_PREFIX

    ENV['LDFLAGS'] = '-framework Cocoa'
    system "./configure", "--prefix=#{prefix}",
                          "--disable-dependency-tracking",
                          "--disable-sdltest"
    system "make install"
  end
end
