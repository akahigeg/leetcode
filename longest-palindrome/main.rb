# @param {String} s
# @return {String}

# Approach 4: Expand Around Center
#
# ref: https://leetcode.com/problems/longest-palindromic-substring/discuss/272469/Ruby-solution-%3A-O(n2)
#
# Runtime: 877 ms, faster than 75.82% of Ruby online submissions for Longest Palindromic Substring.
# Memory Usage: 211 MB, less than 57.69% of Ruby online submissions for Longest Palindromic Substring.
def longest_palindrome(s)
  head, tail = 0, 0

  center_position = 0
  while center_position < s.size
    len1 = expand_around_center(s, center_position, center_position)
    len2 = expand_around_center(s, center_position, center_position + 1)
    len = [len1, len2].max

    # 既存の範囲より長ければheadとtailを更新
    if tail - head < len
      head = center_position - (len - 1) / 2
      tail = center_position + len / 2
    end

    center_position += 1
  end

  s[head..tail]
end

# ある場所から左右に範囲を広げて回文の長さを得る
def expand_around_center(str, left, right)
  while 0 <= left && right < str.size && str[left] == str[right]
    left -= 1
    right += 1
  end
  right - left - 1
end

# ref: https://leetcode.com/problems/longest-palindromic-substring/discuss/184276/ruby-version-answer
#
# Runtime: 1695 ms, faster than 45.60% of Ruby online submissions for Longest Palindromic Substring.
# Memory Usage: 214.3 MB, less than 5.49% of Ruby online submissions for Longest Palindromic Substring.
def longest_palindrome_s(s)
  r_s = s.reverse
  c_lists = {}
  index = 0
  answer = ""
  s.each_char do |c|
    c_lists[c] ||= []
    c_lists[c].push(index)
    c_lists[c].each do |i|
      p answer
      if s[i..index] == r_s[(-index - 1)..(-i - 1)] &&
           answer.size < index - i + 1
        answer = s[i..index]
        break
      end
    end
    index += 1
  end

  answer
end

p longest_palindrome(
    "zudfweormatjycujjirzjpyrmaxurectxrtqedmmgergwdvjmjtstdhcihacqnothgttgqfywcpgnuvwglvfiuxteopoyizgehkwuvvkqxbnufkcbodlhdmbqyghkojrgokpwdhtdrwmvdegwycecrgjvuexlguayzcammupgeskrvpthrmwqaqsdcgycdupykppiyhwzwcplivjnnvwhqkkxildtyjltklcokcrgqnnwzzeuqioyahqpuskkpbxhvzvqyhlegmoviogzwuiqahiouhnecjwysmtarjjdjqdrkljawzasriouuiqkcwwqsxifbndjmyprdozhwaoibpqrthpcjphgsfbeqrqqoqiqqdicvybzxhklehzzapbvcyleljawowluqgxxwlrymzojshlwkmzwpixgfjljkmwdtjeabgyrpbqyyykmoaqdambpkyyvukalbrzoyoufjqeftniddsfqnilxlplselqatdgjziphvrbokofvuerpsvqmzakbyzxtxvyanvjpfyvyiivqusfrsufjanmfibgrkwtiuoykiavpbqeyfsuteuxxjiyxvlvgmehycdvxdorpepmsinvmyzeqeiikajopqedyopirmhymozernxzaueljjrhcsofwyddkpnvcvzixdjknikyhzmstvbducjcoyoeoaqruuewclzqqqxzpgykrkygxnmlsrjudoaejxkipkgmcoqtxhelvsizgdwdyjwuumazxfstoaxeqqxoqezakdqjwpkrbldpcbbxexquqrznavcrprnydufsidakvrpuzgfisdxreldbqfizngtrilnbqboxwmwienlkmmiuifrvytukcqcpeqdwwucymgvyrektsnfijdcdoawbcwkkjkqwzffnuqituihjaklvthulmcjrhqcyzvekzqlxgddjoir",
  )
p longest_palindrome("ccc")
p longest_palindrome("aaaaa")
p longest_palindrome("zbabadx")
p longest_palindrome("cbbd")
p longest_palindrome("ac")
p longest_palindrome("abb")
p longest_palindrome("adam")
p longest_palindrome("daacbbcaab")
