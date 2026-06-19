[README.md](https://github.com/user-attachments/files/29136776/README.md)
# バニラシリーズ / Vanilla Series

Single‑file vanilla HTML tools for AI‑powered vibecoding.
Lightweight, framework‑free parts designed for educational and creative coding workflows.

それぞれが **1ファイルで完結する HTML** です。ビルド不要・依存ゼロで、OpenAI 互換の LLM API にそのまま繋いで動きます。AI エージェントが読み・直し・生成しやすいよう、意図的にシンプルに作っています。

---

## 🚀 How to Run (IMPORTANT)

このプロジェクトの HTML は、**ローカルサーバ経由での起動を前提**にしています。
ファイルをダブルクリックして開くと、接続設定の保存・読み込みなど一部の機能が **正しく動きません**。

### ✔ 正しい起動方法

1. Python がインストールされていることを確認
2. 同梱の **`start-local-server.bat`** をダブルクリック
3. 自動的にローカルサーバが起動し、ブラウザが開きます

### ❌ やってはいけないこと

- HTML ファイルを直接ダブルクリックして開く（`file://` で開く）
  → 設定を保存しても次回読み込まれない・通信がブロックされるなど、一部機能が動作しません

> **なぜ？** `file://` で開くと、ブラウザのセキュリティ制約（オリジン・CORS・ストレージの扱い）により、保存した接続設定が次回に引き継がれなかったり、API 通信が弾かれたりするためです。

---

## ✨ Features

- 🪶 **Vanilla JS / HTML / CSS only** — ビルドツールもフレームワークもなし
- 📄 **Single‑file** — 1ファイルで画面が完結。外部CSS/外部フォントに頼らない設計
- 🔌 **OpenAI 互換 API 対応** — おてもとLLM / OpenAI / Gemini / カスタム（Ollama・LM Studio 等）を切り替え可能
- ⚡ **SSE ストリーミング** — 逐次表示に対応し、TTFT・生成速度・トークン使用量を計測表示
- 🧠 **メモリ圧縮（自動要約）** — 古い会話を要約して長い対話でも文脈を保持
- 🤖 **AI‑friendly structure** — 依存が少なく明快なパターンで、AI が読み・改変しやすい
- 🎨 **Composable / Remixable** — コピーして組み替え、すぐ試作に使える
- 🧩 **Education‑ready** — 生徒の制作物やバイブコーディング体験の教材に

---

## 📦 Components

| Component | File | Description |
|-----------|------|-------------|
| バニラチャット | `vanilla_chat.html` | コンテキスト保持チャット。通常モード／単発（計測）モード、メモリ圧縮、用語集つき |
| バニラキャラチャット | `chara_chat.html` | 性格を設定したキャラと会話。会話に応じて感情パラメータが増減（感情データはセリフに混ぜない設計） |
| `start-local-server.bat` | — | Python を検出してローカルサーバを起動し、ブラウザを開くランチャー |

> バニラシリーズは順次追加していきます。各ツールは単体で動くので、必要なものだけ取り出して使えます。

---

## 🧪 Example Usage

### 1. 起動して接続設定する

`start-local-server.bat` で開いたら、画面上部の **「接続設定」** タブから接続先を選びます。

| 接続先 | 入力するもの |
|--------|--------------|
| おてもとLLM | APIサーバーURL・Client Key・Server Secret |
| OpenAI | API Key（※ブラウザ直結は CORS で弾かれる場合あり） |
| Gemini | API Key（※同上） |
| カスタム / ローカル | エンドポイントURL（Ollama・LM Studio 等）・Token（任意） |

入力した接続情報は **そのPCのブラウザ内だけ** に保存されます。共有PCでは利用後に削除してください。

### 2. AI に組ませる（vibecoding）

AI エージェントに、このリポジトリの単体HTMLを部品として渡し、次のように指示すると素早く組み替えられます：

```
このリポジトリのバニラシリーズ（単体HTML）を参考に UI を作ってください。
必要なパーツを選び、1ファイル完結のまま HTML/CSS/JS を組み合わせてください。
```

各ファイルは依存ゼロ・1ファイル完結なので、まるごと読み込ませて改変・再生成させやすくなっています。

---

## 📚 Use Cases

- Vibecoding 体験用の教材
- AI に UI を生成させるときの部品セット
- OpenAI 互換 API の接続・ストリーミング・計測のサンプル
- プロトタイピング
- 教育用 Web アプリの部品集
- コードリーディング教材

---

## 🤝 Contributing

Pull Request / Issue は歓迎です。
ただし、**AI が扱いやすいよう複雑化しないこと**、**1ファイルで完結すること** を重視しています。

---

## 📄 License

MIT License
自由に使って、改造して、再配布できます。

---

## 👤 Author

Created by **オレラント**
Building small vanilla components for AI vibecoding.
