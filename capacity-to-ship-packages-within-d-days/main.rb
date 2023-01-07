# @param {Integer[]} weights
# @param {Integer} days
# @return {Integer}

# ref: https://leetcode.com/problems/capacity-to-ship-packages-within-d-days/solution/
# Runtime: 307 ms, faster than 94.74% of Ruby online submissions for Capacity To Ship Packages Within D Days.
#Memory Usage: 213.7 MB, less than 47.37% of Ruby online submissions for Capacity To Ship Packages Within D Days.
def ship_within_days(weights, days)
  total_load = weights.sum
  max_load = weights.max

  while max_load < total_load
    mid = (total_load + max_load) / 2
    if feasible(weights, mid, days)
      total_load = mid
    else
      max_load = mid + 1
    end
  end

  max_load
end

def feasible(weights, capacity, days)
  days_needed = 1
  current_load = 0
  weights.each do |w|
    current_load += w
    if current_load > capacity
      days_needed += 1
      current_load = w
    end
  end

  days_needed <= days
end

p ship_within_days([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 5)

p ship_within_days([3, 2, 2, 4, 1, 4], 3)
