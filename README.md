<div align="center">
<h1>asdf-lean</h1>
<span><a href="https://leanprover.github.io">Lean 4</a> plugin for asdf version manager</span>
</div>
<hr />

[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/pnrao/asdf-lean/workflow.yml?style=flat-square)](https://github.com/pnrao/asdf-lean/actions)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)
[![License](https://img.shields.io/github/license/pnrao/asdf-lean?style=flat-square&color=brightgreen)](https://github.com/pnrao/asdf-lean/blob/master/LICENSE)

Supports **Lean 4** on Linux (x86_64, aarch64) and macOS (x86_64, Apple Silicon).

## Prerequirements

- Make sure you have the required dependencies installed:
  - curl
  - git
  - zstd (and a tar with zstd support — standard on macOS 12+; install `zstd` on Linux)

## Installation

```bash
asdf plugin-add lean https://github.com/pnrao/asdf-lean.git
```

## Usage

Check [asdf](https://github.com/asdf-vm/asdf) readme for instructions on how to
install & manage versions.

## License

Licensed under the
[Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0).
