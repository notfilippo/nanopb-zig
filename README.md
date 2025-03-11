# `nanopb` Runtime

This is the [nanopb runtime](https://github.com/nanopb/nanopb), packaged for [Zig](https://ziglang.org/).

## Status

This project only builds the `nanopb` runtime library. It does not build the `nanopb`
code [generator](https://github.com/nanopb/nanopb/tree/master/generator).

Linux, macOS and Windows are tested by CI.

## Usage

First, update your `build.zig.zon`:

```sh
# Initialize a `zig build` project if you haven't already
zig init
# replace <refname> with the version you want to use, e.g. 0.4.9.1+0.14.0
zig fetch --save git+https://github.com/notfilippo/nanopb#<refname>
```

You can then use `nanopb` in your `build.zig` with:

```zig
const nanopb_dep = b.dependency("nanopb", .{
    .target = target,
    .optimize = optimize,
});
your_exe.linkLibrary(nanopb_dep.artifact("nanopb"));
```