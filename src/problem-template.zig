// [](https://leetcode.com/problems//)
const tests = .{
    .{
        undefined,
        .{},
    },
    .{
        undefined,
        .{},
    },
};

// Constraints:

const utils = @import("./testing_utils.zig");

test " " {
    const module = @import("./solutions/.zig");
    const function = utils.getFunction(module);
    try utils.testSolution(function, tests);
}
