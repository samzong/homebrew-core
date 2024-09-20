class Macmusicplayer < Formula
  desc "Simple macOS music player for the menu bar"
  homepage "https://github.com/samzong/MacMusicPlayer"
  url "https://github.com/samzong/MacMusicPlayer/archive/refs/tags/v10.tar.gz"
  sha256 "d877d57754b1848ea853fea0c7fb297abab4326ecd6885bf86069e056b7f6985"
  license "MIT"

  depends_on xcode: :build
  depends_on :macos

  def install
    xcodebuild "-configuration", "Release", "SYMROOT=build"
    prefix.install "build/Release/MacMusicPlayer.app"
  end

  def caveats
    <<~EOS
      MacMusicPlayer.app was installed in #{opt_prefix}.
      You may create a symlink to /Applications or ~/Applications with:
        ln -s #{opt_prefix}/MacMusicPlayer.app /Applications/MacMusicPlayer.app
    EOS
  end

  test do
    assert_predicate prefix/"MacMusicPlayer.app/Contents/MacOS/MacMusicPlayer", :exist?
  end
end
