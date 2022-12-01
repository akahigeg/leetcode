# @param {Integer[]} nums
# @param {Integer} val
# @return {Integer}

# Runtime: 167 ms, faster than 23.56% of Ruby online submissions for Remove Element.
# Memory Usage: 211 MB, less than 80.44% of Ruby online submissions for Remove Element.
def remove_element_using_reject(nums, val)
  # 制約: 新しい配列を作ってはいけない
  nums.reject!{|n| n == val }
  nums.size # Submissionでは数を返すとパスする 結果にはnumsの内容が出てくる 謎い
end

# 実際のところは消した数をどう詰めるの？って言う意図の問題
#
# Runtime: 76 ms, faster than 94.67% of Ruby online submissions for Remove Element.
# Memory Usage: 211 MB, less than 45.33% of Ruby online submissions for Remove Element.
def remove_element(nums, val)
  # 制約: 新しい配列を作ってはいけない
  i = 0
  
  # 線形探索してvalが見つかったら末尾の数を取ってきて埋める
  while nums[i]
    if nums[i] == val
      if i == nums.size - 1
        # 末尾までループしてきて末尾がvalならpopして終了
        nums.pop
      else
        # popした数がvalの場合があるのでiをそのままにループ
        nums[i] = nums.pop
        next
      end
    end
      
    # p "i: #{i}, nums[i]: #{nums[i]}, #{nums}"
    i += 1
  end

  nums
end

p remove_element([3,2,2,3], 3)
p remove_element([0,1,2,2,3,0,4,2], 2)
p remove_element([2,2,3], 2)
p remove_element([0,4,4,0,4,4,4,0,2], 4)
p remove_element([0,1,2,2,3,0,4,2], 2)