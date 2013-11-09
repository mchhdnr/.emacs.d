Emacs24用設定ファイル
-------------------
(C)2013 mchhdnr
mchhdnr@gmail.com

個人用の日本語入力に対応したEmacs用設定ファイル群です。
付属のスクリプトを実行することで素の状態のEmacsからおよそ定番と思われる設定がされた状態にすることができます。

＊ライセンス
色設定のmolokai-theme.elをGPLライセンスに則って再配布しています。
元バージョンは
https://github.com/hbin/molokai-theme
です。
anything, auto-complete, popup.el, emacs-mozcはここには含まれていないので別途入手する必要があります。install.shを実行することでこれらは自動的に所定の位置にダウンロードされます。
install.shとinit.elはGNU General Public License(GPL)に準じます。

＊要件
Emacs24
Ubuntu*1
（M+IPAフォント（日本語用）*2）

*1) install.shでapt-getを使用しているため、Fedora等では手動で
emacs-mozcとemacs-mozc-bin
のパッケージをインストールして下さい。
*2) デフォルトではM+IPAフォントですが、必要に応じて変更して下さい。

＊手順
[install.shを使う場合]
必要に応じて
$ chmod +x install.sh
を行った後、
$ ./install.sh
を実行すれば必要なディレクトリ等が準備されます。
途中でインストールするかどうか尋ねられるので確認の上"y"を入力してください。
init.elが予め存在する場合、そのまま続行すると元のファイルがinit.el.backというファイルとして残り、この設定ファイルに置き換えられます。

[手動でインストールする場合]
install.shは
~/.emacs.d/以下にこのフォルダの
init.el
site-lisp/
をすべてコピーした後、手動で~/.emacs.d/site-lisp/以下に
anything-config
auto-complete
popup.el
インストールして下さい。
