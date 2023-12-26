// [125. Valid Palindrome](https://leetcode.com/problems/valid-palindrome/)
const tests = .{ .{
    true,
    .{
        "A man, a plan, a canal: Panama",
    },
}, .{
    false,
    .{
        "race a car",
    },
}, .{
    true,
    .{
        " ",
    },
} };

// Constraints:
// 1 <= s.length <= 2 * 10^5
// s consists only of printable ASCII characters.

const utils = @import("./testing_utils.zig");

test "125. Valid Palindrome - If" {
    const module = @import("./solutions/125-if.zig");
    const function = utils.getFunction(module);
    try utils.testSolution(function, tests);
}
