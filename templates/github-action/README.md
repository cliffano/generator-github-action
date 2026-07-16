<!-- BEGIN:AVATAR -->
To be populated by generator-github-action github-action-partials
<!-- END:AVATAR -->

<!-- BEGIN:BADGES -->
To be populated by generator-github-action github-action-partials
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

## Colophon

<!-- BEGIN:DEVELOPERS_GUIDE -->
To be populated by generator-github-action github-action-partials
<!-- END:DEVELOPERS_GUIDE -->

<!-- BEGIN:BUILD_REPORTS -->
To be populated by generator-github-action github-action-partials
<!-- END:BUILD_REPORTS -->
