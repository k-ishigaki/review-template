# [Re:VIEW](https://reviewml.org/ja/)執筆環境

Re:VIEWによる日本語の技術書の執筆環境です．  
開発環境とソースコードがこのリポジトリ1つにまとまっているため，すぐに執筆を開始できます．

## 必要なもの

* Git
* Docker（WindowsまたはMacのDocker DesktopでもOK）
    * daemon  
        `docker context`で設定すればリモートのDocker daemonを使うこともできます．
    * client
    * Compose  
    __Composeはclient同梱のCompose V2を使ってください__（別途docker-composeをインストールしている場合はアンインストールしてください．）
* Visual Studio Code  
    * Dev Containers plugin (`ms-vscode-remote.remote-containers`)
    * （リモートのDocker daemonを使用する場合）Remote - SSH (`ms-vscode-remote.remote-ssh`)

## 特徴

* Docker上で動作するため，ローカルの環境を汚さずに使用できる
* VS Codeの[Dev Container](https://code.visualstudio.com/docs/remote/containers)を使うので，GUIで直感的に編集できる
* [textlint](https://github.com/textlint/textlint)による文書校正が利用できる

## 使い方

1. （リモートのDocker daemonを使用する場合）`Remote - SSH: Conntect to Host...`でリモートPCに入る
1. `Git: Clone`などで任意のフォルダにダウンロード
1. `File: Open Folder`でダウンロードした`review-template`フォルダを開く
1. `Dev Containers: Reopen in Container`でDev Containerを起動
1. src/src.reを開いて編集  
  `review: Show preview`コマンドでプレビューを見ながら編集できます．
1. `Ctrl + Shift + B`または`⌘ + Shift + B`でビルド  
  `src`ディレクトリ配下に`book.pdf`が生成されます．VSCodeで開くとプレビューできます．

## 構成

* src：Re:VIEWのソースコード
* .textlintrc.yml：textlintのルール定義
* allow.yml：textlintで無視したいパターン定義
* prh.yml：prhのルール定義
