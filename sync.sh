#!/bin/sh
# site/ の写真一覧から index.html を再生成し、Neocities へアップロードする
set -e
cd "$(dirname "$0")"

# neocities CLI が PATH に無ければ gem のユーザーインストール先を補完
if ! command -v neocities >/dev/null 2>&1; then
  export PATH="$HOME/.local/share/gem/ruby/3.2.0/bin:$PATH"
fi

: > site/index.html
for f in site/*.jpeg site/*.jpg site/*.png site/*.gif site/*.webp; do
  [ -f "$f" ] || continue
  echo "<img src=$(basename "$f")>" >> site/index.html
done

neocities push site
echo "OK: https://v0n5ai.neocities.org/"
