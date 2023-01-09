require "language/node"

class TwilioAT611 < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-dev.s3.amazonaws.com/twilio-v6.1.1/twilio-v6.1.1.tar.gz"
  version "6.1.1"
  sha256 "893dd9fb82330271f6b1d64b235027d26dd92577b5132c8debb274803bbc78e4"
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
