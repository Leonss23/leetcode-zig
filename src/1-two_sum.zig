const std = @import("std");
const testing = std.testing;
const twoSum = @import("./solutions/1.zig").twoSum;
const TwoSum = @typeInfo(@TypeOf(twoSum));
const TwoSumFn = TwoSum.Fn;
const Addends = TwoSumFn.return_type.?;
const Nums = TwoSumFn.params[1].type.?;
const Target = TwoSumFn.params[2].type.?;

const Test = struct {
    input: Input,
    expect: Output,
    const Output = Addends;
    const Input = struct {
        nums: Nums,
        target: Target,
    };
};

// Constraints:
// 2 <= nums.length <= 10^4
// -10^9 <= nums[i] <= 10^9
// -10^9 <= target <= 10^9
// Only one valid answer exists.

const tests = [_]Test{
    .{
        .input = .{
            .nums = &[_]isize{ 2, 7, 11, 15 },
            .target = 9,
        },
        .expect = .{ 0, 1 },
    },
    .{
        .input = .{
            .nums = &[_]isize{ 3, 2, 4 },
            .target = 6,
        },
        .expect = .{ 1, 2 },
    },
    .{
        .input = .{
            .nums = &[_]isize{ 3, 3 },
            .target = 6,
        },
        .expect = .{ 0, 1 },
    },
};

test "two sum" {
    for (tests) |t| {
        try testing.expectEqual(t.expect, twoSum(testing.allocator, t.input.nums, t.input.target));
    }
}
