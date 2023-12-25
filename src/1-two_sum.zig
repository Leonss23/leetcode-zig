const module = @import("./solutions/1.zig");

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
const function = utils.getFunction(module);

test "two sum" {
    try utils.testSolution(function, tests);
}
