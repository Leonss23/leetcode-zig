// [20. Valid Parenthesis](https://leetcode.com/problems/valid-parenthesis/)
const tests = .{.{
    true,
    .{
        "()",
    },
    true,
    .{
        "()[]{}",
    },
    false,
    .{
        "(]",
    },
}};

// Constraints:
// 1 <= s.length <= 10^4
// s consists of parentheses only '()[]{}'.

const utils = @import("./testing_utils.zig");

test "20. Valid Parenthesis" {
    const module = @import("./solutions/20.zig");
    const function = utils.getFunction(module);
    try utils.testSolution(function, tests);
}
