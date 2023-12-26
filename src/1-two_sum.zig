const tests = .{ .{
    .{ 0, 1 },
    .{
        &.{ 2, 7, 11, 15 },
        9,
    },
}, .{
    .{ 1, 2 },
    .{
        &.{ 3, 2, 4 },
        6,
    },
}, .{
    .{ 0, 1 },
    .{
        &.{ 3, 3 },
        6,
    },
} };

// Constraints:
// 2 <= nums.length <= 10^4
// -10^9 <= nums[i] <= 10^9
// -10^9 <= target <= 10^9
// Only one valid answer exists.

const utils = @import("./testing_utils.zig");

test "1. Two Sum - Bruteforce" {
    const module = @import("./solutions/1-bruteforce.zig");
    const function = utils.getFunction(module);
    try utils.testSolution(function, tests);
}

test "1. Two Sum - Hashmap" {
    const module = @import("./solutions/1-hashmap.zig");
    const function = utils.getFunction(module);
    try utils.testSolution(function, tests);
}
