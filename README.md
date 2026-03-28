<p align="center">
  <a href="https://kilnx.dev"><img src="https://raw.githubusercontent.com/kilnx-org/kilnx/main/.github/banner.svg" alt="kilnx" width="600"/></a>
</p>

<p align="center">
  <a href="https://railway.com/deploy/kilnx"><img src="https://railway.com/button.svg" alt="Deploy on Railway" height="44"></a>
</p>

## Kilnx on Railway

Deploy a [Kilnx](https://kilnx.dev) app on Railway in one click.

### What you get

- A running Kilnx web app with SQLite
- Health check on `/healthz`
- `PORT` env var auto-configured by Railway
- Persistent SQLite database in `/data/`

### How to use

1. Click **Deploy on Railway** above
2. Edit `app.kilnx` with your own models, pages, and actions
3. Push to trigger a rebuild

The included `app.kilnx` is a simple task list. Replace it with anything from the [examples](https://github.com/kilnx-org/examples) or write your own using the [grammar reference](https://github.com/kilnx-org/kilnx/blob/main/GRAMMAR.md).

### Environment variables

| Variable | Default | Description |
|----------|---------|-------------|
| `PORT` | `8080` | Set automatically by Railway |
| `DATABASE_URL` | `sqlite:///data/app.db` | SQLite path |
| `SECRET_KEY` | `change-me-in-production` | Session signing secret |

### Persistent storage

Railway provides ephemeral filesystems by default. To persist your SQLite database across deploys, attach a [Railway Volume](https://docs.railway.com/guides/volumes) mounted at `/data`.

### Local development

```bash
# Clone this template
git clone https://github.com/kilnx-org/railway-template.git myapp
cd myapp

# Install kilnx
git clone https://github.com/kilnx-org/kilnx.git /tmp/kilnx
cd /tmp/kilnx && go build -o ~/bin/kilnx ./cmd/kilnx/ && cd -

# Run locally
kilnx run app.kilnx
```

### Links

- [Kilnx website](https://kilnx.dev)
- [Grammar reference](https://github.com/kilnx-org/kilnx/blob/main/GRAMMAR.md)
- [Features](https://github.com/kilnx-org/kilnx/blob/main/FEATURES.md)
- [Examples](https://github.com/kilnx-org/examples)
