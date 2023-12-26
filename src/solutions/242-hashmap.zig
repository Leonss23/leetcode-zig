const std = @import("std");

pub fn validAnagram(allocator: std.mem.Allocator, s: []const u8, t: []const u8) !bool {
    if (s.len != t.len) return false;

    var char_count = std.AutoHashMap(u8, isize).init(allocator);
    defer char_count.deinit();

    for (s) |char| {
        const entry = try char_count.getOrPut(char);
        switch (entry.found_existing) {
            false => entry.value_ptr.* = 1,
            true => entry.value_ptr.* += 1,
        }
    }

    for (t) |char| {
        const entry = try char_count.getOrPut(char);
        switch (entry.found_existing) {
            false => return false,
            true => entry.value_ptr.* -= 1,
        }
    }

    var char_count_it = char_count.iterator();
    while (char_count_it.next()) |value| {
        if (value.value_ptr.* != 0) return false;
    }
    return true;
}
