# [Re:VIEW](https://reviewml.org/ja/)執筆環境

Re:VIEWによる日本語の技術書の執筆環境です．

## 必要なもの

* Git
* Docker（WindowsまたはMacのDocker DesktopでもOK）
    * daemon  
        `docker context`コマンドでリモートのDocker Daemonを使うこともできます．
    * client
    * Compose (__Version 1.21以上__)
* Visual Studio Code  
    * Remote Container plugin

## 特徴

* Docker上で動作するため，ローカルの環境を汚さずに使用できる
* VS Code（GUI）で使える
* [textlint](https://github.com/textlint/textlint)による文書校正が利用できる

## 使い方

### `Clone Repository in Container Volume`（推奨）

1. VS Codeを起動し，`Remote-Containers: Clone Repository in Container Volume...`コマンドを実行
  パラメータは以下を指定してください．
  * Repository url: https://github.com/k-ishigaki/review-template
  * Volume name: `vsc-remote-containers`
  * Target folder name: `review-template`
2. src/src.reを開いて編集
  `review: Show preview`コマンドでプレビューを見ながら編集できます．
3. `Ctrl + Shift + B`または`⌘ + Shift + B`でビルド  
  srcディレクトリ配下にbook.pdfが生成されます．

### `Reopen in Container`

注意：この方法はリモートのDocker Daemonでは使用できません．

1. 本リポジトリをダウンロードし，VS Codeで開く
2. （Linuxの場合）.envファイルを編集し，UIDとGIDの値を使用するユーザーと合わせる
3. `Remote-Containers: Reopen in Container`コマンドを実行
4. src/src.reを開いて編集  
  `review: Show preview`コマンドでプレビューを見ながら編集できます．
5. `Ctrl + Shift + B`または`⌘ + Shift + B`でビルド  
  srcディレクトリ配下にbook.pdfが生成されます．

## 構成

* src：Re:VIEWのソースコード
* .textlintrc：textlintのルール定義
* prh.yml：prhのルール定義

## 制限事項

ビルドしたbook.pdfを選ぶとPDFのプレビューが表示されますが，日本語が表示されません．（割と致命的……）