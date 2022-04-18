# GitHubPages中的Jekyll插件白名单

GitHub Pages cannot build sites using unsupported plugins. If you want to use unsupported plugins, generate your site locally and then push your site's static files to GitHub.

GitHub Pages无法使用不受支持的插件构建网站。如果您想使用不受支持的插件，请在本地生成您的网站，然后将网站的静态文件推送到GitHub。

## GitHub pages 默认插件

官方文档 [GitHub pages plugins](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/about-github-pages-and-jekyll#plugins)

GitHub Pages uses plugins that are enabled by default and cannot be disabled:

- [`jekyll-coffeescript`](https://github.com/jekyll/jekyll-coffeescript)
- [`jekyll-default-layout`](https://github.com/benbalter/jekyll-default-layout)
- [`jekyll-gist`](https://github.com/jekyll/jekyll-gist)
- [`jekyll-github-metadata`](https://github.com/jekyll/github-metadata)
- [`jekyll-optional-front-matter`](https://github.com/benbalter/jekyll-optional-front-matter)
- [`jekyll-paginate`](https://github.com/jekyll/jekyll-paginate)
- [`jekyll-readme-index`](https://github.com/benbalter/jekyll-readme-index)
- [`jekyll-titles-from-headings`](https://github.com/benbalter/jekyll-titles-from-headings)
- [`jekyll-relative-links`](https://github.com/benbalter/jekyll-relative-links)

## 更新GitHub Pages gem

Jekyll是一个活跃的开源项目，经常更新。如果您计算机上的`github-pages`宝石与GitHub Pages服务器上的`github-pages` gem 不一致，则您的网站在本地构建时可能与在GitHub上发布时看起来不同。为了避免这种情况，请定期更新计算机上的`github-pages`宝石。

1. 打开终端。

2. 更新 `github-pages` gem 。

      - 如果您安装了Bundler，请运行`bundle update github-pages`。

      - 如果您没有安装Bundler，请运行`gem update github-pages`。


## GitHub pages 支持的插件

For a list of supported plugins, see "[Dependency versions](https://pages.github.com/versions/)" on the GitHub Pages site. For usage information for a specific plugin, see the plugin's documentation.

## GitHub pages 插件白名单

地址：[GitHub pages Plugin white list](https://github.com/github/pages-gem/blob/master/lib/github-pages/plugins.rb)

```ruby
# frozen_string_literal: true

module GitHubPages
  # Manages the constants that govern which plugins are allowed on GitHub Pages
  class Plugins
    # Plugins which are activated by default
    DEFAULT_PLUGINS = %w(
      jekyll-coffeescript
      jekyll-commonmark-ghpages
      jekyll-gist
      jekyll-github-metadata
      jekyll-paginate
      jekyll-relative-links
      jekyll-optional-front-matter
      jekyll-readme-index
      jekyll-default-layout
      jekyll-titles-from-headings
    ).freeze

    # Plugins allowed by GitHub Pages
    PLUGIN_WHITELIST = %w(
      jekyll-coffeescript
      jekyll-commonmark-ghpages
      jekyll-feed
      jekyll-gist
      jekyll-github-metadata
      jekyll-paginate
      jekyll-redirect-from
      jekyll-seo-tag
      jekyll-sitemap
      jekyll-avatar
      jemoji
      jekyll-mentions
      jekyll-relative-links
      jekyll-optional-front-matter
      jekyll-readme-index
      jekyll-default-layout
      jekyll-titles-from-headings
      jekyll-include-cache
      jekyll-octicons
      jekyll-remote-theme
    ).freeze

    # Plugins only allowed locally
    DEVELOPMENT_PLUGINS = %w(
      jekyll-admin
    ).freeze

    # Themes
    THEMES = {
      "minima" => "2.5.1",
      "jekyll-swiss" => "1.0.0",
      "jekyll-theme-primer" => "0.6.0",
      "jekyll-theme-architect" => "0.2.0",
      "jekyll-theme-cayman" => "0.2.0",
      "jekyll-theme-dinky" => "0.2.0",
      "jekyll-theme-hacker" => "0.2.0",
      "jekyll-theme-leap-day" => "0.2.0",
      "jekyll-theme-merlot" => "0.2.0",
      "jekyll-theme-midnight" => "0.2.0",
      "jekyll-theme-minimal" => "0.2.0",
      "jekyll-theme-modernist" => "0.2.0",
      "jekyll-theme-slate" => "0.2.0",
      "jekyll-theme-tactile" => "0.2.0",
      "jekyll-theme-time-machine" => "0.2.0",
    }.freeze

    # Themes to convert to remote themes
    THEMES_TO_CONVERT_TO_REMOTE_THEMES = {
      "jekyll-swiss" => "broccolini/swiss",
      "jekyll-theme-primer" => "pages-themes/primer@v0.6.0",
      "jekyll-theme-architect" => "pages-themes/architect@v0.2.0",
      "jekyll-theme-cayman" => "pages-themes/cayman@v0.2.0",
      "jekyll-theme-dinky" => "pages-themes/dinky@v0.2.0",
      "jekyll-theme-hacker" => "pages-themes/hacker@v0.2.0",
      "jekyll-theme-leap-day" => "pages-themes/leap-day@v0.2.0",
      "jekyll-theme-merlot" => "pages-themes/merlot@v0.2.0",
      "jekyll-theme-midnight" => "pages-themes/midnight@v0.2.0",
      "jekyll-theme-minimal" => "pages-themes/minimal@v0.2.0",
      "jekyll-theme-modernist" => "pages-themes/modernist@v0.2.0",
      "jekyll-theme-slate" => "pages-themes/slate@v0.2.0",
      "jekyll-theme-tactile" => "pages-themes/tactile@v0.2.0",
      "jekyll-theme-time-machine" => "pages-themes/time-machine@v0.2.0",
    }
  end
end
```

