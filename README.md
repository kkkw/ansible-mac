# Ansible Playbook to provision macOS


## 使い方

### 準備

```console
# Install command line tools
$ sudo xcodebuild -license
$ xcode-select --install

# Install homebrew
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
$ brew update

# Install ansible
$ brew install ansible

```

### Run all provisioning


### playbookの準備

このリポジトリをcloneするか、zipダウンロードして展開してください。
場所はどこでもいいです。

```console
$ git clone git@github.com:kkkw/ansible-mac.git
$ cd ansible-mac
```

### playbookの実行

```
# Install ansible collections
$ ansible-galaxy collection install -r requirements.yml
$ ansible-playbook -i hosts localhost.yml --extra-vars '{"mas_email":"foo@example.com","mas_password":"foo-bar"}'
```

### 注意
途中で何度かパスワードを聞かれるので、完全な自動にはならないです。
インストールするものの量にもよりますが、そこそこ時間はかかります。
`cask`や`mas`でバイナリをダウンロードしてくるのに時間がかかるためです。

## 自分用メモ

### osx_defaultsの設定一覧を取得するワンライナー

```console
  echo $(defaults domains) | tr -s ',' '\n' | while read domain; do defaults read $domain; done &> domains.txt
```

### brewから、ansible用にするためのワンライナー

```console
$ echo "homebrew_taps:" && brew tap | awk '{print "  - "$1}'
$ brew list --formula | awk '{print "  - "$1}'
$ brew list --cask | awk '{print "  - "$1}'
```

### plistの変換

```console
$ plutil -convert xml1 foo.plist
$ plutil -convert binary1 foo.plist
```

### 手動で入れるもの

-  Scansnap
-  KensingtonWorks

### 手動でやること

-  sublime text のtabをoffに
-  iterm
  -  カラースキーマを変更
  -  HotKey Windowを設定
