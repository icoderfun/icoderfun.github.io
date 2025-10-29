FROM ruby:3.2-alpine
# ARM64 原生镜像，安装必要依赖
RUN apk add --no-cache build-base git tzdata
# 安装与 GitHub Pages 兼容的 Jekyll 版本及插件/主题
RUN gem install jekyll:3.9.5 jekyll-feed jekyll-seo-tag minima webrick kramdown-parser-gfm
WORKDIR /srv/jekyll
EXPOSE 4000 35729
CMD ["jekyll", "serve", "--livereload", "--incremental", "--host", "0.0.0.0", "--port", "4000", "--livereload-port", "35729", "--force_polling"]
