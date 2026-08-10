#!/bin/sh
# site/ の写真一覧から index.html を再生成し、Neocities へアップロードする
set -e
cd "$(dirname "$0")"

: > site/index.html
for f in site/*.jpeg site/*.jpg site/*.png site/*.gif site/*.webp; do
  [ -f "$f" ] || continue
  echo "<img src=$(basename "$f")>" >> site/index.html
done

neocities push site
echo "OK: https://v0n5ai.neocities.org/"
