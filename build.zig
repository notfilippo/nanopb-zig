const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const upstream = b.dependency("nanopb", .{});

    const lib = b.addStaticLibrary(.{
        .name = "nanopb",
        .target = target,
        .optimize = optimize,
    });

    lib.linkLibC();

    lib.addCSourceFiles(.{
        .root = upstream.path(""),
        .files = &.{ "pb_common.c", "pb_decode.c", "pb_encode.c" },
        .flags = &.{},
    });

    const headers: []const []const u8 = &.{ "pb.h", "pb_common.h", "pb_decode.h", "pb_encode.h" };
    for (headers) |header| {
        lib.installHeader(
            upstream.path(header),
            header,
        );
    }

    b.installArtifact(lib);
}
