# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}

# Runtime: 91 ms, faster than 49.37% of Ruby online submissions for Search a 2D Matrix.
# Memory Usage: 211.2 MB, less than 75.95% of Ruby online submissions for Search a 2D Matrix.
def search_matrix(matrix, target)
  !matrix.flatten.index(target).nil?
end
