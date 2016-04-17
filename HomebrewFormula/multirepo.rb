class Multirepo < Formula
  desc "An easy to use tool to clone and manage multiple git repositories at once."
  homepage "https://github.com/venator85/multirepo"
  url "https://github.com/venator85/multirepo.git",
    :tag => "v1.0"
  version "1.0"

  bottle :unneeded

  def install
    bin.install "multirepo"
  end
end
