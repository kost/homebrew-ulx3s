# Homebrew Repository for ULX3S Open-Source FPGA Tools

This repository allows you to easily install essential set of tools for ULX3S programming. Also, comes with tools for ICE40 related boards.


## Getting Started

To build FPGA programs for ULX3S board, you'll need the `ujprog`, `project-trellis`, `yosys`, and `nextpnr` tools.

Installing a simple toolchain is as easy as running the following:

```
$ brew tap kost/homebrew-ulx3s
$ brew install --HEAD project-trellis yosys nextpnr-trellis ujprog
```

You can also install alternative to ujprog called openFPGALoader:

```
$ brew install --HEAD openfpgaloader
```

## Features

ULX3S tools:

  - project-trellis
  - nextpnr-trelllis
  - yosys
  - ujprog
  - fujprog
  - openfpgaloader

ICE40 tools:

  - icestorm
  - nextpnr-ice40
  - yosys

## Development

You can always create new tap from current directory
```
brew tap test/ulx3s .
```

Note that you need to untap if you have tap by that name already:
```
brew untap test/ulx3s
```

# Credits

trellis related and ice stuff is taken and adapted from: https://github.com/ktemkin/homebrew-oss-fpga
