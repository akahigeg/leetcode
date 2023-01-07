# The is_bad_version API is already defined for you.
# @param {Integer} version
# @return {boolean} whether the version is bad
# def is_bad_version(version):

def is_bad_version(n, bad)
  n == bad
end

# Runtime: 95 ms, faster than 67.68% of Ruby online submissions for First Bad Version.
# Memory Usage: 210.9 MB, less than 6.57% of Ruby online submissions for First Bad Version.
# @param {Integer} n
# @return {Integer}
def first_bad_version(n, bad)
  lo = 1
  hi = n
  last_bad_version = nil

  while lo <= hi
    mid = (lo + hi) / 2

    if is_bad_version(mid, bad)
      last_bad_version = mid
      hi = mid - 1
    else
      last_bad_version = mid + 1
      lo = mid + 1
    end
  end

  last_bad_version
end

p first_bad_version(5, 4)
p first_bad_version(2, 2)
p first_bad_version(3, 2)
