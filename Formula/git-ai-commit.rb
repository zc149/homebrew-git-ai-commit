class GitAiCommit < Formula
  desc "AI-powered Git commit message generator with parallel diff parsing"
  homepage "https://github.com/zc149/git-ai-commit"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/zc149/git-ai-commit/releases/download/v0.3.0/git-ai-commit-darwin-arm64"
    sha256 "2a94ce8a6f1fff40921221d56f0d4662078dc6498c7b55767ba6c0960d10871c"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/zc149/git-ai-commit/releases/download/v0.3.0/git-ai-commit-darwin-amd64"
    sha256 "df59e4191edc4fdd3d3ff71797320a9aef6e2a9753653c52a78a1ae37c234664"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/zc149/git-ai-commit/releases/download/v0.3.0/git-ai-commit-linux-amd64"
    sha256 "5fcdb592dcea60c9e36922c8764a64cc69bc574849aea9285045bf1c263d34ff"
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

# 업데이트 로그:
# v0.3.0: 병렬 diff 파싱 기능 추가 (Worker Pool 패턴)
# - 대규모 커밋 처리 성능 향상 (50+ 파일: ~50% 속도 향상)
# - 동적 worker 수 조절 (2-8 workers)
# - 조건부 병렬화 (소규모 커밋은 순차 처리)
#
# SHA256 해시값 업데이트 방법:
# 1. GitHub Releases에 v0.3.0 릴리스 생성 및 바이너리 업로드
# 2. 다음 명령으로 SHA256 계산:
#    shasum -a 256 git-ai-commit-darwin-arm64
#    shasum -a 256 git-ai-commit-darwin-amd64
#    shasum -a 256 git-ai-commit-linux-amd64
# 3. 위 값으로 PLACEHOLDER_SHA256_*를 교체