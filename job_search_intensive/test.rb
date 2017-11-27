# def zig_zag (root)
#   level = 0
#   processing = [root]
#   until processing.empty?
#     level_arr = []
#     until processing.empty?
#       method = level.even? ? :pop : :shift
#       level_arr << processing.send(method)
#     end
#     until level_arr.empty?
#       el = level_arr.shift
#       p el.value
#       processing += el.children
#     end
#     level += 1
#   end
# end

# def speak_n_say(num)
#   num_str = num.to_s
#   5.times do
#     result = ''
#     counter = 1
#     this_char = num_str[0]
#     num_str.chars.each_with_index do |char, i|
#       next if i == 0
#       if char == this_char
#         counter += 1
#       else
#         result += counter.to_s
#         result += this_char
#         this_char = char
#         counter = 1
#       end
#     end
#     result += counter.to_s
#     result += this_char
#     p result
#     num_str = result
#   end
# end
#
# p speak_n_say(1131)

# def rocks_and_water(str, speed = 0, recursion = 0)
#   p "input: #{str}, level: #{recursion}, speed: #{speed}"
#   if str[0] == '*' && str.length == 1
#     p true
#     return true
#   end
#   if str[0] == '~'
#     p false, str
#     return false
#   end
#   result1, result2, result3 = false, false, false
#
#   unless speed == 0 || speed > str.length
#     result1 = rocks_and_water(str[speed..-1], speed, recursion + 1)
#   end
#   unless speed + 1 > str.length
#     result2 = rocks_and_water(str[speed+1..-1], speed + 1, recursion + 1)
#   end
#   unless speed == 0 || speed - 1 > str.length
#     result3 = rocks_and_water(str[speed-1..-1], speed - 1, recursion + 1)
#   end
#   result1 || result2 || result3
#
# end

def rocks_and_water(str, speed = 0)

  return true if str[0] == '*' && str.length == 1

  return false if str[0] == '~'

  result1, result2, result3 = false, false, false

  unless speed == 0 || speed > str.length
    result1 = rocks_and_water(str[speed..-1], speed)
  end

  unless speed + 1 > str.length
    result2 = rocks_and_water(str[speed+1..-1], speed + 1)
  end

  unless speed == 0 || speed - 1 > str.length
    result3 = rocks_and_water(str[speed-1..-1], speed - 1)
  end

  result1 || result2 || result3
end

p rocks_and_water('**~*~*~~*~***~~*')
p rocks_and_water('**~~~*~*~~*~***~~*')
