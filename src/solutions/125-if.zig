const std = @import("std");

pub fn validPalindrome(s: []const u8) !bool {
    var right_idx = s.len - 1;
    for (s, 0..) |left, left_idx| {
        if (!isAlphaNumeric(left)) continue;

        while (right_idx >= left_idx) : (right_idx -= 1) {
            const right = s[right_idx];

            if (!isAlphaNumeric(right)) continue;

            if (lowercase(left) != lowercase(right)) return false;

            right_idx -= 1;
            break;
        }
    }

    return true;
}

// "A man, a plan, a canal: Panama"
// "race a car"
// " "

fn lowercase(c: u8) u8 {
    return switch (c) {
        'A'...'Z' => c + ' ',
        else => c,
    };
}
fn isAlphaNumeric(c: u8) bool {
    return switch (c) {
        'A'...'Z', 'a'...'z', '0'...'9' => true,
        else => false,
    };
}
