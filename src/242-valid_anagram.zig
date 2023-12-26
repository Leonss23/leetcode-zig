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

test "242. Valid Anagram - Hashmap" {
    const module = @import("./solutions/242-hashmap.zig");
    const function = utils.getFunction(module);
    try utils.testSolution(function, tests);
}

test "242. Valid Anagram - Sort" {
    const module = @import("./solutions/242-sort.zig");
    const function = utils.getFunction(module);
    try utils.testSolution(function, tests);
}
