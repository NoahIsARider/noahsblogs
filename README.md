# Shibui Blogs

This is a Hugo static blog project already cleaned up into a proper personal site repository.

It keeps the minimalist, terminal-adjacent, monochrome feel of the original theme, while moving content, configuration, and deployment entry points to the repository root for easier long-term writing and maintenance.

## Structure

```text
.
├── archetypes/          # New post templates
├── assets/css/          # Theme styles and custom overrides
├── content/             # Site content
│   ├── _index.md
│   ├── about.md
│   └── posts/
├── layouts/             # Hugo templates
├── static/              # Static assets
├── .github/workflows/   # GitHub Pages deployment
├── hugo.toml            # Main site configuration
└── vercel.json          # Vercel build configuration
```

## Writing

To add a new post, run this at the repository root:

```bash
hugo new posts/my-new-post.md
```

New posts use [archetypes/default.md](./archetypes/default.md) as the default template, including:

- `title`
- `date`
- `draft`
- `description`
- `tags`
- `toc`
- `showreadingtime`

Place the actual article content under `content/posts/`.

## Local Preview

If Hugo is installed locally:

```bash
hugo server -D
```

The `-D` flag includes draft posts.

## Deployment

### GitHub Pages

The repository already includes the GitHub Actions workflow [`.github/workflows/gh-page.yml`](./.github/workflows/gh-page.yml).

- Pushing to `main` or `master` triggers build and deployment automatically
- The build output directory is `public/`

Recommended repository setting:

- `Settings -> Pages -> Build and deployment -> Source: GitHub Actions`

### Vercel

The repository also includes [vercel.json](./vercel.json):

- Build command: `hugo --gc --minify`
- Output directory: `public`

Once imported into Vercel, it should usually work without extra configuration. If the platform asks for an explicit Hugo version, add `HUGO_VERSION` in the project environment variables.

## Site Configuration

The main configuration file is [hugo.toml](./hugo.toml). Common edits include:

- `baseURL`
- `title`
- `params.author.name`
- `params.description`
- `params.footerText`
- menu `menu.main`

## Style Notes

The current site direction emphasizes:

- minimalism
- strong readability
- monochrome structure
- a terminal or document-index undertone

If you want to keep refining the visuals, start with [assets/css/custom.css](./assets/css/custom.css).
