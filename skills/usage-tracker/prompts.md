# Usage tracker prompts

## Daily usage check

```
Check my AI API usage for today.
- Query each enabled provider for current usage
- Calculate total spend
- Compare to daily budget from config
- Flag any unusual spikes

Format:
💰 DAILY USAGE
OpenAI: $X.XX
Anthropic: $X.XX
Total: $X.XX / $50 (XX%)
```

## Weekly report

```
Generate a weekly usage report with per-model breakdown, week-over-week change, and 2–3 cost optimization suggestions.
```

## Budget alert

```
ALERT: API usage approaching limit.
Report current spend vs budget, time remaining in the period, and which service drove the spike.
```
