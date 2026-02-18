# BRIDGE

BRIDGE is the PHOBOS shell/runtime layer.

## Contents

- `shell.c` - current shell entry and command handling
- `lib.c` - runtime helpers and syscall integration
- `*.mtc` - mt-lang sources used for BRIDGE components/experiments

## Build

```bash
make
```

Outputs:

- `build/bridge_lib.o`
- `build/bridge_shell.o`

These objects are linked into the kernel by the superproject.

## Optional mt-lang Build

```bash
make mt
```

Compiles `tokenizer.mtc` in bare-metal mode (no libc runtime) using `mtc`.

## Variables

```bash
make KERNEL_DIR=../phobos-kernel/kernel OUT_DIR=build
```

- `KERNEL_DIR` - kernel include path
- `OUT_DIR` - output directory for bridge objects
