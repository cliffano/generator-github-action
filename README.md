<!-- BEGIN:AVATAR -->
![Avatar](avatar.jpg)
<!-- END:AVATAR -->

<!-- BEGIN:BADGES -->
[![Build Status](https://github.com/cliffano/generator-github-action/workflows/CI/badge.svg)](https://github.com/cliffano/generator-github-action/actions?query=workflow%3ACI)
[![Security Status](https://snyk.io/test/github/cliffano/generator-github-action/badge.svg)](https://snyk.io/test/github/cliffano/generator-github-action)
<!-- END:BADGES -->

# Generator GitHub Action

Generator GitHub Action is Code generator for GitHub Actions.

It provides the following components:

| Component | Description |
|-----------|-------------|
| github-action | <some_component_desc> |
| github-action-partials | Partial snippets for GitHub Action README sections |

## Usage

Generate code generator project:

```shell
make generate-github-action
```

Generate GitHub Action partial snippets:

```shell
make generate-github-action-partials
```

This component will prompt you the following inputs:

| Prompt | Description |
|--------|-------------|
| Project ID | Used for package names and project repo name. |
| Project Name | Used in documentation or comments. |
| Project Description | Used in documentation or comments. |
| Author Name | The name of the project author. |
| Author Email | The email of the project author. |
| Author URL | The author's website URL. |
| GitHub ID | The GitHub ID of the project repo. |

## Usage With Config File

Each component also has a `-with-config` target that skips the interactive prompts by reading the inputs from an Actobat YAML config file. See [examples/](examples/) for sample config files for each component.

Pass the config file path via the `GENERATOR_CONFIG` variable, it defaults to `actobat.yml`:

```shell
make generate-github-action-with-config GENERATOR_CONFIG=path/to/actobat.yml
make generate-github-action-partials-with-config GENERATOR_CONFIG=path/to/actobat.yml
```

Move to the generated project directory:

```shell
cd stage/github-action/
```

## Configuration

| Key | Value |
|-----|-------|
| project_id | generator-github-action |
| project_name | Generator GitHub Action |
| project_desc | Code generator for GitHub Actions |
| author_name | Cliffano Subagio |
| author_email | blah@cliffano.com |
| github_id | cliffano |
| github_repo | generator-github-action |

## Colophon

<!-- BEGIN:DEVELOPERS_GUIDE -->
[Developer's Guide](https://cliffano.github.io/developers-guide-makefile.html)
<!-- END:DEVELOPERS_GUIDE -->

<!-- BEGIN:BUILD_REPORTS -->
Build reports:

<!-- END:BUILD_REPORTS -->

Related Projects:

* [Actobat](https://github.com/cliffano/actobat) - Makefile for building GitHub Actions
