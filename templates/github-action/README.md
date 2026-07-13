<!-- BEGIN:AVATAR -->
![Avatar](avatar.jpg)
<!-- END:AVATAR -->

<!-- BEGIN:BADGES -->
[![Build Status](https://github.com/{{github_id}}/{{github_repo}}/workflows/CI/badge.svg)](https://github.com/{{github_id}}/{{github_repo}}/actions?query=workflow%3ACI)
[![Security Status](https://snyk.io/test/github/{{github_id}}/{{github_repo}}/badge.svg)](https://snyk.io/test/github/{{github_id}}/{{github_repo}})
<!-- END:BADGES -->

# {{project_name}}

{{project_name}} is a {{project_desc}}.

## Usage

Transform a message and access all transformed values:

```yaml
jobs:
  build:
    steps:
      - id: message
        uses: {{github_id}}/{{github_repo}}@main
        with:
          message: 'Hello World'
      - run: |
          echo "Original: $\{{ steps.message.outputs.original }}"
          echo "Reverse: $\{{ steps.message.outputs.reverse }}"
          echo "Uppercase: $\{{ steps.message.outputs.uppercase }}"
          echo "Lowercase: $\{{ steps.message.outputs.lowercase }}"
```

Transform a message supplied via an environment variable:

```yaml
env:
  MESSAGE: 'GitHub Action'
jobs:
  build:
    steps:
      - id: message
        uses: {{github_id}}/{{github_repo}}@main
        with:
          message: $\{{ env.MESSAGE }}
```

## Configuration

| Input | Type | Description | Required | Default | Example |
|-------|------|-------------|----------|---------|---------|
| message | string | Message text to transform | Yes | - | `Hello World` |

| Output | Description | Example |
|--------|-------------|---------|
| original | Original message text | `Hello World` |
| reverse | Message text in reverse order | `dlroW olleH` |
| uppercase | Message text in upper case | `HELLO WORLD` |
| lowercase | Message text in lower case | `hello world` |
