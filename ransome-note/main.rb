# @param {String} ransom_note
# @param {String} magazine
# @return {Boolean}

# なんか知らんが初回速かったのなんだ？
# Runtime: 293 ms, faster than 62.20% of Ruby online submissions for Ransom Note.
# Memory Usage: 215.2 MB, less than 40.16% of Ruby online submissions for Ransom Note.
#
# Runtime: 671 ms, faster than 8.27% of Ruby online submissions for Ransom Note.
# Memory Usage: 215.2 MB, less than 40.16% of Ruby online submissions for Ransom Note.
def can_construct(ransom_note, magazine)
  m = magazine.chars.sort.join

  letter_count = {}
  ransom_note.chars.sort.each do |letter|
    if letter_count.key?(letter)
      letter_count[letter] += 1
    else
      letter_count[letter] = 1
    end
  end

  letter_count.each do |letter, count|
    # p letter * count
    # p m
    return false unless m.include?(letter * count)
  end

  true
end

p can_construct("bg", "efjbdfbdgfjhhaiigfhbaejahgfbbgbjagbddfgdiaigdadhcfcj")
