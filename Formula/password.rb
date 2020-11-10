class Encrypt < Formula
  desc "Generate and decrypt password"
  homepage "https://github.com/joel/homebrew-password"
  version "0.1"

  url "https://github.com/joel/homebrew-password/archive/main.zip", :using => :curl

  def install
    bin.install "bin/password"
  end
end
