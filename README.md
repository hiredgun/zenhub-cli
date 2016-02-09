# zenhub-cli <sub><sup>| Powerful ZenHub CLI via pure bash</sup></sub>
[![version](http://img.shields.io/badge/version-v0.1.0-blue.svg)](https://github.com/rockymadden/zenhub-cli/releases)
[![versioning](http://img.shields.io/badge/versioning-semver-blue.svg)](http://semver.org)
[![branching](http://img.shields.io/badge/branching-github%20flow-blue.svg)](https://guides.github.com/introduction/flow/)
[![license](http://img.shields.io/badge/license-mit-blue.svg)](https://opensource.org/licenses/MIT)
[![pm](http://img.shields.io/badge/pm-zenhub-blue.svg)](https://www.zenhub.io)
[![chat](http://img.shields.io/badge/chat-slack-blue.svg)](https://rockymadden-slack.herokuapp.com)
[![circleci](https://circleci.com/gh/rockymadden/zenhub-cli.svg?style=shield)](https://circleci.com/gh/rockymadden/zenhub-cli)

A simple, yet extremely flexible command line interface for [ZenHub](https://www.zenhub.io). Deep
integration with [jq](https://github.com/stedolan/jq) allows for the ability to perform complex
declarative/higher-order operations on responses, helping you perform complex piping/compositional
operations with relative ease (see the [integration tests](test/integration) for some simple
examples).

## Installation
```bash
# Install from tap:
$ brew tap rockymadden/rockymadden
$ brew install zenhub-cli

# Initialize with your ZenHub and GitHub tokens:
$ zenhub init
Enter ZenHub API token: <zenhub token>
Enter GitHub personal access token (used solely for project slug lookups): <github token>
```

> __PROTIPS:__
* Ensure you have a [ZenHub API token](https://dashboard.zenhub.io/#/settings)
* Ensure you have a [GitHub personal access token](https://github.com/settings/tokens)

## Usage
```bash
$ zenhub --help
Usage:
  zenhub board <project> [--compact|-c] [--filter|-f <filter>] [--monochrome|-m]
  zenhub events <project> <issue> [--compact|-c] [--filter|-f <filter>] [--monochrome|-m]
  zenhub init [--compact|-c] [--filter|-f <filter>] [--github-token|-G <token>] [--monochrome|-m]
    [--zenhub-token|-Z <token>]
  zenhub issue <project> <issue> [--compact|-c] [--filter|-f <filter>] [--monochrome|-m]

Configuration Commands:
  init    Initialize

Core Commands:
  board     Project board pipelines plus the issues contained within each pipeline
  events    Project issue events, sorted by most recent
  issue     Project issue time estimate, pipeline, and +1s
```

> __PROTIPS:__
* Project slug represented as a combination of username and project name
(e.g. rockymadden/zenhub-cli).
* `--` can be used as a placeholder for the current project, when inside a GitHub-based git repo.
* Project placeholder is implicitly applied, when not provided and inside a GitHub-based git repo.
* Filters are simply [jq filters](https://stedolan.github.io/jq/manual/), you can provide any filter
that it can handle.
* All commands prompt for required arguments which were not provided via options or arguments. This
allows for both traditional usage and prompt-based usage.

## Examples and Recipes

### `board`:

```bash
# Implicit project:
$ zenhub board

# Placeheld project:
$ zenhub board --

# Explicit project:
$ zenhub board rockymadden/zenhub-cli

# With filter:
$ zenhub board --filter='.pipelines | .[0] | .name'
```

### `events`:

```bash
# Placeheld project and explicit issue:
$ zenhub events -- 1

# With filter:
$ zenhub events --filter='.[0] | .user_id'
```

### `issue`:

```bash
# Placeheld project and explicit issue:
$ zenhub issue -- 1

# With filter:
$ zenhub issue --filter='.pipeline | .name'
```

## License
```
The MIT License (MIT)

Copyright (c) 2016 Rocky Madden (https://rockymadden.com/)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```
