# Documentation Style Guide

dicehub documentation guidelines is based on the excellent [documentation styleguide by GitLab](https://docs.gitlab.com/ee/development/documentation/styleguide/) and has been modified to dicehub's requirements.

This documentation is intended as the single source of truth and serves as a
guide on how to write the documentation for dicehub.

This document defines the standards for documentation content.

## Types of documentation

It is best practice to have only these types of documentation:

1. Concepts
1. How-to-guide
1. Explanation
1. Reference

## Link instead of summarize

Avoid summarizing to have multiple places with the same information, link
instead.

## Markdown

All documentation is written in [Markdown](https://en.wikipedia.org/wiki/Markdown).

### HTML in Markdown

Hard-coded HTML is valid as long as:

- There is no equivalent in Markdown
- Advanced tables are necessary
- Special styling is required
- It has been approved and introduced as a special rule by the team

### Markdown Rules

For consistency all Markdown files are linted by [markdownlint-cli](https://github.com/igorshubovych/markdownlint-cli) with custom rules defined in the
[.markdownlint.yaml](../../.markdownlint.yaml) file. This files also enforces
the proper use of names.

For example:

- dicehub (requires lower `d`)
- Python (requires capital `P`)

To lint your files, use the following command:

```sh
make lint # run from the project root
```

## Structure

The documentation is organized by topics and not by types.

### Folder structure overview

The documentation is separated by these main topics:

- Guide
- Tutorials
- Development
- About

All other directories are additional topics which can not be attributed to the
preceding topics. The can exist on their own or in multiple topics, for example
`API` can be inside User, Administration or Development.

The table below shows what kind of documentation belongs in which directory.

| Directory              | What belongs here                                                                             |
|:-----------------------|:----------------------------------------------------------------------------------------------|
| `docs/guide/`           | User related documentation. Everything related to the dicehub concept and its features.                          |
| `docs/development/`    | Documentation related to the development of dicehub.                                          |

### Work with directories and files

1. When you create a new directory, always start with an `index.md` file.
   Do not use another file name and **do not** create `README.md` files.
1. **Do not** use special characters and spaces, or capital letters in file
   names, directory names, branch names, and anything that generates a path.
1. When creating a new document and it has more than one word in its name,
   make sure to use underscores (`_`) instead of spaces or dashes (`-`).
   For example, a proper naming would be `create_project_as_admin.md`.
   The same rule applies to other files.
1. Do not upload video files to the product repositories.
   [Link or embed videos](#videos) instead.

Use your best judgment to place documents and then ask the reviewer of your MR
to confirm your decision.

### Avoid duplication

Do not include the same information in multiple places.

### Structure within documents

- Structure content in alphabetical order in tables, lists, and so on, unless
  there is a logical reason not to.

## Language

- Keep it as short as possible, be clear and concise.
- Write in US English with US grammar.
