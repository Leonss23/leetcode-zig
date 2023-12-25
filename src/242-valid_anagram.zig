const module = @import("./solutions/242.zig");

const tests = .{
    .{
        true,
        .{
            "anagram", "nagaram",
        },
    },
    .{
        false,
        .{
            "rat", "car",
        },
    },
};

// Constraints:
// 1 <= s.length, t.length <= 5 * 10^4
// s and t consist of lowercase English letters

const utils = @import("./testing_utils.zig");
const function = utils.getFunction(module);

test "valid anagram" {
    try utils.testSolution(function, tests);
}
