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

## Usage

Generate code generator project:

    make generate-github-action

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

Move to the generated project directory:

    cd stage/github-action/

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
