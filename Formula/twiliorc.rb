require "language/node"

class Twiliorc < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/channels/rc/twilio-v6.1.4/twilio-v6.1.4.tar.gz"
  version "6.1.4"
  sha256 "ac568f03e3794210f068b16f1ead24ee413f9531fc45be9c3d08a404b8feb506"
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