// [704. Binary Search](https://leetcode.com/problems/binary-search/)
const tests = .{.{}};

// Constraints:

const utils = @import("./testing_utils.zig");

test "704. Binary Search" {
    const module = @import("./solutions/704.zig");
    const function = utils.getFunction(module);
    try utils.testSolution(function, tests);
}
