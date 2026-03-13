# Senate Install — Copy-Paste Command Block

Give this to your AI agent (Claude Code, Codex, etc.) in the directory where your project lives (or will live):

---

```
Fetch https://raw.githubusercontent.com/kescott027/senate/main/bootstrap/initiator.md and execute the instructions in it. This is the project directory.
```

---

That's it. The AI will:
1. Download the initiator
2. Detect whether this is a new project, existing project, or empty directory needing a repo
3. Download the governance framework and bootstrap guides
4. Walk you through setup
5. Begin execution

## Alternate: If the AI doesn't have web access

If your AI agent cannot fetch URLs, download the initiator manually and paste its contents:

```bash
curl -sL https://raw.githubusercontent.com/kescott027/senate/main/bootstrap/initiator.md
```

Then tell the AI: "Execute the instructions in this document. This is the project directory." followed by the file contents.
