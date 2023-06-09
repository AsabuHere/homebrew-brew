require "language/node"

class TwilioAT103 < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-dev.s3.amazonaws.com/twilio-v1.0.3/twilio-v1.0.3.tar.gz"
  version "1.0.3"
  sha256 "05570874704baa3c39e30356866898b2b3b53ed2a099d35d7a68ea596a5511e9"
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
