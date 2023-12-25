const std = @import("std");

pub fn containsDuplicate(allocator: std.mem.Allocator, nums: []const isize) !bool {
    var seen = std.AutoHashMap(isize, bool).init(allocator);
    defer seen.deinit();
    try seen.ensureTotalCapacity(@intCast(nums.len));

    for (nums) |num| {
        switch (seen.contains(num)) {
            true => return true,
            false => seen.putAssumeCapacityNoClobber(num, true),
        }
    }
    return false;
}
