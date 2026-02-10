class GitAiCommit < Formula
  desc "AI-powered Git commit message generator with parallel diff parsing"
  homepage "https://github.com/zc149/git-ai-commit"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/zc149/git-ai-commit/releases/download/v0.4.0/git-ai-commit-darwin-arm64"
    sha256 "182b6e57da3bb3c4fe9d865ad81aa6cded9deeeb1078b82ad484070dbbe00528"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/zc149/git-ai-commit/releases/download/v0.4.0/git-ai-commit-darwin-amd64"
    sha256 "92e08c6728c196d2a44c52c271b584e82a7e79aa7b24377f407ff3627c95fc12"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/zc149/git-ai-commit/releases/download/v0.4.0/git-ai-commit-linux-amd64"
    sha256 "c54f72ba9f0c225e2892830b32b54907ffe6794623d929a08ed8c92161294998"
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
# v0.4.0: 커밋 메시지 반복 생성, 캐시 시스템, 치명적 버그 수정
# - 커밋 메시지 재추천 기능 (r 키)
# - 캐시 시스템: 선택한 메시지를 diff hash 기반으로 저장
# - 이전 메시지 사용 기능 (p 키)
# - 치명적 버그 수정: 대규모 커밋(17개 이상 파일)에서 deadlock 발생 문제 해결
# - 커밋 타입 분류 정확도 향상 (feat를 build로 잘못 분류하는 문제 해결)
# - Scope 추천 개선 (과도한 파일 나열 문제 해결)
# - detail 기본값을 low로 수정
# v0.3.0: 병렬 diff 파싱 기능 추가 (Worker Pool 패턴)
# - 대규모 커밋 처리 성능 향상 (50+ 파일: ~50% 속도 향상)
# - 동적 worker 수 조절 (2-8 workers)
# - 조건부 병렬화 (소규모 커밋은 순차 처리)
#
# SHA256 해시값 업데이트 방법:
# 1. GitHub Releases에 v0.4.0 릴리스 생성 및 바이너리 업로드
# 2. 다음 명령으로 SHA256 계산:
#    shasum -a 256 git-ai-commit-darwin-arm64
#    shasum -a 256 git-ai-commit-darwin-amd64
#    shasum -a 256 git-ai-commit-linux-amd64
# 3. 위 값으로 이전 버전의 SHA256 값을 교체
