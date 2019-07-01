ngx.say("<p>Welcome to Picture Server</p>")

ngx.say("<p>http://localhost:9191/images/test.jpg 返回原图</p>")
ngx.say("<p>http://localhost:9191/images/test.jpg/resize,w_200,h_200 w为宽 h为高,会返回test.jpg w为200 高为200的缩率图</p>")