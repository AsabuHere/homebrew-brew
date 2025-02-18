require "language/node"

class TwilioAT612 < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-dev.s3.amazonaws.com/twilio-v6.1.2/twilio-v6.1.2.tar.gz"
  version "6.1.2"
  sha256 "f1ed858bcb649e2646e5b8b50587eff1b79b52af756a51c6c2ed1f09e5b902ab"
  depends_on "node"

  def install
    inreplace "bin/twilio", /^CLIENT_HOME=/, "export TWILIO_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/twilio"
  end

  def post_install
    pid = spawn("node #{libexec}/welcome.js")
    Process.wait pid
  end
end
