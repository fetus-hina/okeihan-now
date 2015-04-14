おけいはんなう
==============

[おけいはんなう](https://kh.fetus.jp/)のソースコードです。

編成や時刻表も含めて全て入っているのでそのまま fork サイトを構築することができますが、
京阪決め打ちでコードが書いてあるので、他の鉄道会社に適用するのは困難です。


バグレポート等
--------------

* 季節特別ダイヤは華麗に無視するか、遅れて反映する傾向にあります。（正月ダイヤ等は無視します。春ダイヤ・秋ダイヤは遅れます）
* 淀臨時停車などは完全に無視します。
* 編成が違うのは気がついた時に直します。（普段は萱島～天満橋を往復する生活をしているので、7,8両はともかく4両に変化があると本当に気づきません）

編成が違うとか、存在する車番なのにエラーになるとかがあれば [Issue](https://github.com/fetus-hina/okeihan-now/issues) を登録するか、
Twitter で [@fetus\_hina](https://twitter.com/fetus_hina) まで連絡してください。


実装方針に関する部分
--------------------

* OAuth を使った Twitter 連携は作りません。
    - 作者は Android 使いです。Android では Twitter の Web Intents を使ってアプリに横取りさせた方が Android らしい遷移になります。
    - OAuth を使った連携にしようとすると、Twitter の読み書き権限を要求してしまいます。
      トークンの管理に重大な責任を負うことになりますが、このアプリのためにそのような責任を負いたくありません。


動かし方
--------

コピーサイトを作るとか、バグフィックスのために動かしてみるとかは次の環境や手順で動作させられます。

### 動作環境 ###

どの環境で動作するかというのはあまり意識していませんが、次の環境で開発・動作しています。

* docker （コンテナのベースイメージは CentOS 7）
* HHVM 3.6 （少し前までは普通の PHP 5.4）

今は docker で動作していますが、普通に Apache+mod\_php とかでも動きます。たぶん。

### docker のコンテナイメージの生成 ####

1. `make` と `sudo` と `docker` が使えるようにサーバを設定します。
2. `make docker` を実行します。
    - 本番用にビルドするには `make docker-release`
3. たぶん `jp3cki/okeihannow:latest` というイメージが出来ます。
    - 本番用は `jp3cki/okeihannow:release`
    - 開発用と本番用はタグが違うだけ。

### docker イメージの実行 ####

普通に単発でコンテナを起動するには、

```bash
# docker run --privileged -dti -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 8001:80 jp3cki/okeihannow:latest
```

とか実行します。これで母艦の 8001/TCP でおけいはんなう専用ウェブサーバが listen しているように見えるので、
どこかからリバースプロキシでそこへ中継してやります。

コンテナの自動起動とかをしたければ、上のコマンドと同等のものを `init` なり `systemd` が食えるようにすれば良いです。


おことわり
----------

* 本来 docker はこのプログラムのように複数のプロセスを動作させるのではなく、単一プロセスを動作させることを
  前提に作られています。真似しないことをおすすめします。
    - `Dockerfile` を確認するとよくわかりますが、systemd 周りでひどいことになっています。
* プロジェクトは Yii Framework 1 をベースに開発しています。もはや時代遅れなのであまり参考にしない方が良いです。
* 歴史的事情で composer 周りが微妙なことになっています。あまり参考にしない方が良いです。


ライセンス
----------

```
The MIT License (MIT)

Copyright (c) 2012-2015 AIZAWA Hina <hina@bouhime.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
