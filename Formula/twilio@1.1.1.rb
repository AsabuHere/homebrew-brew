require "language/node"

class TwilioAT111 < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-dev.s3.amazonaws.com/twilio-v1.1.1/twilio-v1.1.1.tar.gz"
  version "1.1.1"
  sha256 "e03706a2887cc25786f9c08b46750b9177978646d9747e732836f986f232dea5"
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
