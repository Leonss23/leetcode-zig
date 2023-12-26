const std = @import("std");

pub fn twoSum(nums: []const isize, target: isize) ![2]isize {
    for (nums, 0..) |x, i| {
        const expected = target - x;
        for (nums, 0..) |y, j| {
            if (j == i) continue;
            if (expected == y) return .{ @intCast(i), @intCast(j) };
        }
    }
    return error.Invalid;
}
