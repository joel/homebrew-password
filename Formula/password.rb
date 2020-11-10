class Encrypt < Formula
  desc "Generate password"
  homepage "https://github.com/joel/homebrew-password"
  version "0.1"

  url "https://github.com/joel/homebrew-password/archive/0.1.zip", :using => :curl

  def install
    bin.install "bin/password"
  end
end
