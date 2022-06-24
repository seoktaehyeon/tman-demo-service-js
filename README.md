# Frontend NPM Build Demo

## 如何编译构建

```bash
docker build -t tman-demo-service:js .
```

## 如何运行服务

```bash
docker run -d -p 8080:80 -it tman-demo-service:js
```

## 如何访问服务

浏览器访问 `http://127.0.0.1:8080`
