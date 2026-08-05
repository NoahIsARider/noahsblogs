# Shibui Blogs

这是一个已经整理成“个人站点仓库”的 Hugo 静态博客项目。

它保留了原本极简、终端感、单色系的视觉风格，但站点内容、配置和部署入口都已经切换到仓库根目录，更适合长期写作和维护。

## 目录结构

```text
.
├── archetypes/          # 新文章模板
├── assets/css/          # 主题样式与自定义覆盖
├── content/             # 站点内容
│   ├── _index.md
│   ├── about.md
│   └── posts/
├── layouts/             # Hugo 模板
├── static/              # 静态资源
├── .github/workflows/   # GitHub Pages 部署
├── hugo.toml            # 站点主配置
└── vercel.json          # Vercel 构建配置
```

## 写作方式

新增文章时，直接在根目录运行：

```bash
hugo new posts/my-new-post.md
```

生成的文章会使用 [archetypes/default.md](./archetypes/default.md) 作为模板，默认包含：

- `title`
- `date`
- `draft`
- `description`
- `tags`
- `toc`
- `showreadingtime`

文章正文放在 `content/posts/` 下即可。

## 本地预览

如果本机装了 Hugo：

```bash
hugo server -D
```

`-D` 会把草稿文章也一起显示出来。

## 部署

### GitHub Pages

仓库已经包含 GitHub Actions 工作流 [`.github/workflows/gh-page.yml`](./.github/workflows/gh-page.yml)。

- 推送到 `main` 或 `master` 会自动构建并部署
- 构建输出目录为 `public/`

建议在仓库设置中启用：

- `Settings -> Pages -> Build and deployment -> Source: GitHub Actions`

### Vercel

仓库已经包含 [vercel.json](./vercel.json)：

- 构建命令：`hugo --gc --minify`
- 输出目录：`public`

导入到 Vercel 后，通常无需额外改动；如果平台要求指定 Hugo 版本，再在 Vercel 项目环境变量里补充 `HUGO_VERSION` 即可。

## 站点配置

主配置文件是 [hugo.toml](./hugo.toml)。常改的项目包括：

- `baseURL`
- `title`
- `params.author.name`
- `params.description`
- `params.footerText`
- 菜单 `menu.main`

## 风格说明

当前站点风格强调：

- 极简
- 高可读性
- 黑白单色
- 偏终端 / 文档索引感

如果要继续微调视觉，优先修改 [assets/css/custom.css](./assets/css/custom.css)。
