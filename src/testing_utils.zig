const std = @import("std");
const testing = std.testing;
const allocator = testing.allocator;

fn getFunctionTypes(comptime func: anytype) type {
    const funcInfo = @typeInfo(@TypeOf(func)).Fn;
    const Return = funcInfo.return_type.?;
    const params = funcInfo.params;

    const paramTypes: [params.len]type = blk: {
        var types: [params.len]type = undefined;
        inline for (params, 0..) |param, idx| {
            types[idx] = param.type.?;
        }
        break :blk types;
    };

    return struct {
        const expect = Return;
        const args = paramTypes;
    };
}

pub fn testSolution(comptime solution: anytype, comptime tests: anytype) !void {
    const Types = getFunctionTypes(solution);

    inline for (tests) |t| {
        const expect: Types.expect = t[0];
        const input = switch (Types.args[0]) {
            std.mem.Allocator => .{allocator} ++ t[1],
            else => t[1],
        };
        try testing.expectEqual(Types.expect, @TypeOf(@as(Types.expect, expect)));

        inline for (input, 0..) |arg, idx| {
            try testing.expectEqual(Types.args[idx], @TypeOf(@as(Types.args[idx], arg)));
        }

        try testing.expectEqual(expect, @call(.auto, solution, input));
    }
}

pub fn getFunction(comptime module: type) getFunctionType(module) {
    const moduleInfo = @typeInfo(module);
    const functionName = moduleInfo.Struct.decls[0].name;
    const function = @field(module, functionName);
    return function;
}

fn getFunctionType(comptime module: type) type {
    const moduleInfo = @typeInfo(module);
    const functionName = moduleInfo.Struct.decls[0].name;
    const function = @field(module, functionName);
    return @TypeOf(function);
}
