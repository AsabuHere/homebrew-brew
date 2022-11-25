require "language/node"

class TwiliorcAT1110 < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/channels/rc/twilio-v1.1.10/twilio-v1.1.10.tar.gz"
  version "1.1.10"
  sha256 "a033a539ff524149e4bdf8dcb96fd0185722b778acb4dcf973b4c17c7ff65ba3"
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