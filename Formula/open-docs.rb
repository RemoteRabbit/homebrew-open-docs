class OpenDocs < Formula
  desc "A documentation generator for Terraform/OpenTofu modules, built on open-inspector"
  homepage "https://remoterabbit.github.io/open-docs/"
  license "MPL-2.0"

  depends_on "go" => :build

  deny_network_access!

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/RemoteRabbit/open-docs/releases/download/v0.5.0/open-docs_0.5.0_darwin_arm64.tar.gz"
      sha256 "eb265bcfd96701f7dbec986b7837e7440652b61f6821588b47fb1837200eb702"
    else
      url "https://github.com/RemoteRabbit/open-docs/releases/download/v0.5.0/open-docs_0.5.0_darwin_amd64.tar.gz"
      sha256 "sha256:2cfb77e17849e89713551fe11e6d7d266434ac2574387d813c02f6e5abe16999"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/RemoteRabbit/open-docs/releases/download/v0.5.0/open-docs_0.5.0_linux_arm64.tar.gz"
      sha256 "sha256:a997906403b6958b5be795b63ff612bc3b2a94372d15d261c6c7f529469fdd00"
    else
      url "https://github.com/RemoteRabbit/open-docs/releases/download/v0.5.0/open-docs_0.5.0_linux_amd64.tar.gz"
      sha256 "sha256:b5cfc3c16c5df2c892d1414c976d1c07fd488cdf87079f4bac263a038324c38c"
    end
  end

  def install
    bin.install "open-docs"
  end

  test do
    system "#{bin}/open-docs", "--version"
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "false"
  end
end
