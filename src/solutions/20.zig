const std = @import("std");

pub fn validParenthesis(allocator: std.mem.Allocator, s: []const u8) !bool {
    var open = std.ArrayList(u8).init(allocator);
    defer open.deinit();

    try open.ensureTotalCapacity(s.len / 2);

    for (s) |c| {
        try switch (c) {
            '(', '[', '{' => open.append(c),
            ')', ']', '}' => if (open.pop() != toOpening(c)) return false,
            else => return false,
        };
    }
    if (open.items.len != 0) return false;
    return true;
}

fn toOpening(c: u8) u8 {
    return switch (c) {
        ')' => '(',
        ']' => '[',
        '}' => '{',
        else => unreachable,
    };
}

// "()[]{}"
// "(]"
