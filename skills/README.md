# Example skills

Copy any folder here into your [OpenClaw](https://github.com/openclaw/openclaw) workspace `skills` directory, adjust config, and the agent will match them to relevant requests.

| Skill | What it does |
|-------|----------------|
| [expense-tracker](./expense-tracker) | Parse a receipt image → log vendor, amount, date to a sheet |
| [usage-tracker](./usage-tracker) | Monitor AI API spend and budget alerts |
| [meeting-processor](./meeting-processor) | Extract action items from meeting transcripts |
| [knowledge-base](./knowledge-base) | Personal RAG: ingest sources and query your research |

## Attribution

Several skills are adapted from the open-source [openclaw-productivity-system](https://github.com/kyl3kan3/openclaw-productivity-system) project (MIT). See [ATTRIBUTION.md](./ATTRIBUTION.md).

## Build your own

Each skill is a folder with a `SKILL.md` file (YAML frontmatter + instructions). See the [OpenClaw skills documentation](https://github.com/openclaw/openclaw) for conventions.
