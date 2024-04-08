const std = @import("std");

pub fn maxArea(height: []const usize) usize {
    var max: usize = 0;
    for (height, 0..) |left, left_idx| {
        for (left_idx + 1..height.len) |right_idx| {
            const right = height[right_idx];
            const shortest = if (left <= right) left else right;
            const distance = right_idx - left_idx;
            const area = shortest * distance;
            if (area > max) max = area;
        }
    }
    return max;
}
