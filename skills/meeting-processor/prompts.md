# Meeting processor prompts

## Extract action items

```
Extract action items from this meeting transcript.

For each item: task, owner, deadline (if any), priority (high/medium/low).

Format:
📋 ACTION ITEMS
1. [Task] - @owner - [deadline] - 🔴/🟡/🟢

WAITING ON:
1. [Task] - waiting on [person]
```

## Approval queue

```
Present extracted items for YES/NO approval. Only create tasks for approved items.
```

## Follow-up check

```
Review pending "waiting on" items: overdue, due today, and recently completed.
```
