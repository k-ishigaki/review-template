# [Re:VIEW](https://reviewml.org/ja/)執筆環境

Re:VIEWによる日本語の技術書の執筆環境です．  
開発環境とソースコードがこのリポジトリ1つにまとまっているため，すぐに執筆を開始できます．

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
* VS Codeの[Dev Container](https://code.visualstudio.com/docs/remote/containers)を使うので，GUIで直感的に編集できる
* [textlint](https://github.com/textlint/textlint)による文書校正が利用できる

## 使い方

1. VS Codeを起動し，`Clone Repository in Container Volume...`コマンドで本リポジトリを指定してDev Containerを起動してください．
1. src/src.reを開いて編集  
  `review: Show preview`コマンドでプレビューを見ながら編集できます．
1. `Ctrl + Shift + B`または`⌘ + Shift + B`でビルド  
  srcディレクトリ配下にbook.pdfが生成されます．

## 構成

* src：Re:VIEWのソースコード
* .textlintrc.yml：textlintのルール定義
* allow.yml：textlintで無視したいパターン定義
* prh.yml：prhのルール定義
