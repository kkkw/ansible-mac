# Mac provisioning by Homebrew and Ansible

[このリポジトリ](https://github.com/mawatari/mac-provisioning) を参考(雛形)にして作りました。

## 使い方を3行で

+  `brew` と `ansible` をインストール
+  `roles/{homebrew,homebrew-cask,mas}/vars/main.yml` を編集
+  `HOMEBREW_CASK_OPTS="--appdir=/Applications" ansible-playbook local.yml -vv` を実行

## 注意

このリポジトリにあるplaybookを実行すると、`brew`のところで、`mas-cli`が入ります。
一度、playbookを実行した後で、`mas-cli`を使ってIDなどを探したほうが良いかもしれません。
もしくは、先に`mas-cli`のインストールをしておくかです。

## 使い方

### 準備

`brew` と `ansible` をインストールしてください。
`brew` を先に入れて、`brew` で`ansible`をインストールすればよいと思います。
`mas`のタスクを使用する場合は、先にApp Storeにサインインしておくとよいです。

### playbookの準備

このリポジトリをcloneするか、zipダウンロードして展開してください。
場所はどこでもいいです。

```
cd ~
git clone https://github.com/kkkw/ansible-mac.git
```

###  インストールするリストの編集

下記ファイルをそれぞれ編集してインストールしたいものを記述してください。

```
roles/{homebrew,homebrew-cask,mas}/vars/main.yml
```

masに関してはidだけあれば大丈夫ですが、後々のメンテナンスのため、
nameも一緒に指定しておいたほうがよいです。
caskとmas両方でインストールできるもの(Slack, The Unarchiverなど)は、
caskに寄せていますが、masに寄せても大丈夫です。
両方に記述するのはおすすめしません。

### playbookの実行

```
HOMEBREW_CASK_OPTS="--appdir=/Applications" ansible-playbook local.yml -vv
```

`HOMEBREW_CASK_OPTS`をつけないと、アプリのインストール場所が
`/Applications` だったり、 `~/Applications`だったりになります。

[参考](http://mawatari.jp/archives/mac-provisioning-by-homebrew-and-ansible)

途中で何度かパスワードを聞かれるので、完全な自動にはならないです。
インストールするものの量にもよりますが、そこそこ時間はかかります。
`cask`や`mas`でバイナリをダウンロードしてくるのに時間がかかるためです。

## バッケージの探し方

### brew

```
brew search XXX
```

### cask

```
brew cask search XXX
```

### mas-cli

```
mas search XXX
```

## fork元からの変更点

+  ansible ver2に対応
  -  warningが出ているところを潰した
+  各パッケージのvars(一覧)をroles配下に切り出し
+  `mas-cli` に対応
+  テスト系は削除
+  コールバック系も削除

## 手動で入れるもの

自分用メモ

-  プリントマジック
-  Scansnap
-  Office
-  Synergy

## 手動でやること

+  sublime text のtabをoffに
+  iterm
  -  カラースキーマを変更
  -  HotKey Windowを設定

## 今後のtodo

+  `mas-cli` での削除(state=absent) 的なこと
+  `HOMEBREW_CASK_OPTS` をどうにかする
+  macの設定でコマンドラインでできるやつをansible化
+  dotfails
  -  これは`mackup`もあるからどうしようか要件等

## memo

osx_defaultsの設定一覧を取得するワンライナー

    echo $(defaults domains) | tr -s ',' '\n' | while read domain; do defaults read $domain; done &> domains.txt

brew listから、ansible用にするためのワンライナー

    brew list | cat | sed -e 's/^/- /g'

## License

MIT
