require "language/node"

class TwiliorcAT1113Rc1 < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/channels/rc/twilio-v1.1.13-rc.1/twilio-v1.1.13-rc.1.tar.gz"
  version "1.1.13-rc.1"
  sha256 "8789f1d314ed4bd7c7081d4424fba24fdaa897850d8691a3c78fb8ebc10f5893"
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