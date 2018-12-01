# Docker exercise

dockerで簡単なWebアプリを動かす

- sinatra
- redis

参考資料: http://bekkopen.github.io/docker-workshop

## Usage

### docker-compose を使わず、docker コマンドのみで動かす場合

準備
```console
$ git clone https://github.com/yono/docker-exercise
$ cd docker-exercise
$ docker build . -t yono05/sinatra:latest
```

sinatra だけで動かす
```console
$ docker run --volume $PWD/sinatra:/sinatra --publish 4567:4567 yono05/sinatra:latest ruby /sinatra/app.rb -o 0.0.0.0
```

redis と組み合わせて動かす
```console
$ docker run --rm --name redis --volume $PWD/data:/data redis:5
$ docker run --volume $PWD/sinatra:/sinatra --publish 4567:4567 --link="redis:redis" sinatra:latest ruby /sinatra/app.rb -o 0.0.0.0
```

### docker-compose を使う場合

TODO
