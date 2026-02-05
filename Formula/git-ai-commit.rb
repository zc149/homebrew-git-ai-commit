class GitAiCommit < Formula
  desc "AI-powered Git commit message generator"
  homepage "https://github.com/zc149/git-ai-commit"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/zc149/git-ai-commit/releases/download/v1.0.0/git-ai-commit-darwin-arm64"
    sha256 "600fd8451b0079d9fef3f603db6724f96ec7d1a8f25fe0e227d2b408e02d084a"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/zc149/git-ai-commit/releases/download/v1.0.0/git-ai-commit-darwin-amd64"
    sha256 "a8dcdddc15857dfd9a490b8904877059792c83e734595ebf372189c87bc939ae"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/zc149/git-ai-commit/releases/download/v1.0.0/git-ai-commit-linux-amd64"
    sha256 "07faf3703450e1a6cc6d73c67d16d55ca155cc9897bfc41d8cd75343af40e69d"
  end

  def install
    bin.install "git-ai-commit-darwin-arm64" => "git-ai-commit" if OS.mac? && Hardware::CPU.arm?
    bin.install "git-ai-commit-darwin-amd64" => "git-ai-commit" if OS.mac? && Hardware::CPU.intel?
    bin.install "git-ai-commit-linux-amd64" => "git-ai-commit" if OS.linux? && Hardware::CPU.intel?
  end

  test do
    system bin/"git-ai-commit", "--help"
  end
end
