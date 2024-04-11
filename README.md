# Frp

使用Docker部署FRP服务

推荐：

```
docker build -t wuchenchina/frp:1.0.0 .
```

run：
```
docker run -it --rm --network=host -v ./frps.toml:/data/ftps.toml wuchenchina/frp:1.0.0
```