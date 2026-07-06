---
name: expense-tracker
description: Parse a receipt photo sent to Telegram and log the amount, vendor, and date to a spreadsheet. Use when the user forwards or attaches a receipt image, or asks to log an expense.
---

# Expense Tracker

Turns a photo of a receipt into a logged row. Forward a receipt to your OpenClaw Telegram chat and the agent extracts the total, vendor, and date, then appends them to your sheet.

## How it works
1. An image arrives on the messaging channel.
2. The agent runs OCR / vision on the receipt to read **vendor**, **total**, **date**, and **currency**.
3. It appends a row to the configured sheet (Google Sheet, CSV, or SQLite).
4. It replies with a one-line confirmation so you can catch mis-reads.

## Setup
- Set your sheet target in the workspace config (see `example-config.md` below or the deep-dive guide).
- Grant the agent the messaging + sheet tools it needs — nothing more.

## Steps for the agent
1. If the inbound message has no image, ask the user to attach the receipt. Do not invent values.
2. Extract `vendor`, `total`, `currency`, `date`. If any field is unreadable, state which and ask — never guess an amount.
3. Append `date, vendor, total, currency` to the expense sheet.
4. Reply: `Logged: {vendor} — {currency}{total} on {date}`.

## Guardrails
- Never fabricate a total. Low-confidence reads must be confirmed with the user.
- Read-only on everything except the single expense sheet.

Full build + OCR tuning walkthrough → https://marketmai.com/blog/expense-tracking-openclaw-telegram-guide/
