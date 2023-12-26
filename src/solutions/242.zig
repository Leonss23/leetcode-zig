const std = @import("std");

pub fn validAnagram(allocator: std.mem.Allocator, s: []const u8, t: []const u8) !bool {
    if (s.len != t.len) return false;

    const s_sorted: []u8 = try allocator.alloc(u8, s.len);
    const t_sorted: []u8 = try allocator.alloc(u8, t.len);
    defer allocator.free(s_sorted);
    defer allocator.free(t_sorted);
    std.mem.copyForwards(u8, s_sorted, s);
    std.mem.copyForwards(u8, t_sorted, t);

    std.mem.sort(u8, s_sorted, {}, std.sort.asc(u8));
    std.mem.sort(u8, t_sorted, {}, std.sort.asc(u8));

    return std.mem.eql(u8, s_sorted, t_sorted);
}
