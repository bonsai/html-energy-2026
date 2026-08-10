# html-energy-2026

https://v0n5ai.neocities.org/ の写真サイト。`site/` が Neocities と同期する実体。

## 必要なもの

- WSL(Ubuntu) + Ruby: `gem install neocities --user-install` で CLI を導入
- ログイン: `~/.config/neocities/config.json` に API_KEY / SITENAME を設定(または `NEOCITIES_API_KEY` 環境変数)

## 使い方

### 写真を追加

1. `site/` に新しい写真(JPEG等)を置く
2. `./sync.sh` で index.html を再生成し Neocities に反映
3. `git add . && git commit && git push` でリポジトリを更新

### git push で自動反映(オプション)

pre-push フックを設定すると、`git push` 時に自動で Neocities へ反映される:

```sh
printf '#!/bin/sh\nneocities push site' >.git/hooks/pre-push && chmod u+x .git/hooks/pre-push
```

※ 上記は Neocities サイトの /cli ページ記載の公式手順。index.html は `./sync.sh` で
再生成してからコミットすること。

## 注意

- `neocities push` は gitignore に列挙されたファイルをアップロードしない
- API は1分に1回程度の更新に抑えるよう推奨(過剰な index.html 更新は除外される可能性あり)
