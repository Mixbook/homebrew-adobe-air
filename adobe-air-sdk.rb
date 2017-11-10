# Find downloads at: https://helpx.adobe.com/air/kb/archived-air-sdk-version.html
class AdobeAirSdk < Formula
  desc "SDK for Adobe Air"
  homepage "https://www.adobe.com/devnet/air/air-sdk-download.html"
  url "http://s3.amazonaws.com/air-sdks/AIRSDK_Compiler-21.0.tbz2"
  version "21.0.0.176"
  sha256 "26db85d4c224d084a41a195b1d6e05aad79ee807e44e9f6e13f4484837268cc7"

  bottle :unneeded

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install Dir["*"]
    bin.write_exec_script Dir["#{libexec}/bin/*"]
  end

  def caveats; <<-EOS.undent
    To set AIR_HOME:
      export AIR_HOME=#{libexec}
    EOS
  end

  test do
    assert_equal "#{version}\n", shell_output("#{bin}/adt -version")
  end
end
