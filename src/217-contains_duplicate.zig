const module = @import("./solutions/217.zig");

const tests = .{ .{
    true,
    .{
        &.{ 1, 2, 3, 1 },
    },
}, .{
    false,
    .{
        &.{ 1, 2, 3, 4 },
    },
}, .{
    true,
    .{
        &.{ 1, 1, 1, 3, 3, 4, 3, 2, 4, 2 },
    },
} };

// Constraints:
// 1 <= nums.length <= 10^5
// -10^9 <= nums[i] <= 10^9

const utils = @import("./testing_utils.zig");
const function = utils.getFunction(module);

test "contains duplicate" {
    try utils.testSolution(function, tests);
}
