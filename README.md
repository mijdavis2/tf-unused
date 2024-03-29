# tf-unused

[![release](https://img.shields.io/github/release/mijdavis2/tf-unused.svg)](https://github.com/mijdavis2/tf-unused/releases) [![build](https://github.com/mijdavis2/tf-unused/actions/workflows/build.yaml/badge.svg)](https://github.com/mijdavis2/tf-unused/actions/workflows/build.yaml) [![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit)](https://github.com/pre-commit/pre-commit) [![license](https://img.shields.io/github/license/mijdavis2/tf-unused.svg)](https://github.com/mijdavis2/tf-unused/blob/master/LICENSE.md) [![downloads](https://img.shields.io/github/downloads/mijdavis2/tf-unused/total.svg)](https://github.com/mijdavis2/tf-unused/releases) [![docker image](https://img.shields.io/badge/ghcr-docker--images-blue.svg)](https://github.com/mijdavis2/tf-unused/pkgs/container/tf-unused)

Find unused variables in terraform modules.

> Forked from https://github.com/nvkv/tf-unused and migrated to docker_image based pre-commit hook.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Installation](#installation)
- [Usage](#usage)
- [Examples](#examples)
- [Using with pre-commit](#using-with-pre-commit)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Installation

- Download binary for appropriate platform from [releases](https://github.com/mijdavis2/tf-unused/releases) page.
- Put it somewhere in `$PATH`

## Usage

`tf-unused <path-to-tf-module>`

When no path specified, `tf-unused` will check current directory instead.
If there are unused variables, they will be printed out and process will return non-zero return code.
Otherwise nothing will be printed and process will exit with 0.

## Examples

```
% tf-unused tests/fixtures/has_unused/
In tests/fixtures/has_unused/vars.tf:
 * Unused definition legacy_switch_i_forgot_to_remove
 * Unused definition surprisingly_unimportant_variable

In tests/fixtures/has_unused/some.tfvars:
 * Unused value for some_random_variable

% echo $?
1
```

```
% tf-unused tests/fixtures/has_no_unused/

% echo $?
0
```

## Using with pre-commit

Requires [docker](https://docs.docker.com/engine/install/).

Add this to your `.pre-commit-config.yaml`:

    - repo: https://github.com/mijdavis2/tf-unused
      sha: ''  # Use the sha / tag you want to point at
      hooks:
      - id: tf-unused
