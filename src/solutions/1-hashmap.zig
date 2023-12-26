const std = @import("std");
const Allocator = std.mem.Allocator;

pub fn twoSum(allocator: Allocator, nums: []const isize, target: isize) ![2]usize {
    var seen = std.AutoHashMap(isize, usize).init(allocator);
    defer seen.deinit();
    try seen.ensureTotalCapacity(@intCast(nums.len));

    for (nums, 0..) |num, idx| {
        if (seen.get(num)) |value| return .{ value, idx };

        const expected = target - num;
        seen.putAssumeCapacityNoClobber(expected, idx);
    }
    return error.Invalid;
}
