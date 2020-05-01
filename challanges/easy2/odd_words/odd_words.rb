=begin
- character set: letters, 1 space, 1 point
- word: 1-2 characters
- input: 1+ words, seperated by 1+ spaces, terminated by 0+ spaces and a point

# algo
- split string into words
- loop through words with index
  - if index is odd out put word
  - if index is even output word in reverse
  - add a single space
- at end of loop and a point.
=end

def modify(str)
  splitted = str.gsub(".", " .").split()
  splitted.map.with_index do |word, idx|
    if idx.even?
      word
    else
      word.reverse
    end
  end.join(" ").gsub(" .", ".")
end

# not done yet
# def bonus_modidy(str)
#   result = ""
#   word_count = 0
#   print_zero = true
#   temp = []
#   str.chars.each do |char|
#     if char == " "
#       if print_zero
#         if !temp.empty?
#           result << temp.join("")
#           temp = []
#         end
#         result << char
#         print_zero = false
#         word_count += 1
#       end
#     end
#     if char != " "
#       print_zero = true
#       if word_count.even?
#         result << char
#       else
#         temp.unshift(char)
#       end
#     end
#   end
#   result
# end

p modify("whats the matter with kansas.") == "whats eht matter htiw kansas."
p modify("whats  the    matter  with      kansas .") == "whats eht matter htiw kansas."
p modify("whats  the    matter  with      kansas    .") == "whats eht matter htiw kansas."
p modify("whats the matter with that kansas.") == "whats eht matter htiw that sasnak."
p modify("whats the matter with that kansas  .") == "whats eht matter htiw that sasnak."
p modify("") == ""
p modify(".") == "."
p modify("hello") == "hello"
p modify("hello world.") == "hello dlrow."
p modify("hello world .") == "hello dlrow."
p modify("hello   world  .") == "hello dlrow."
p modify("hello world  .") == "hello dlrow."
p modify("hello world word.") == "hello dlrow word."





#
# p bonus_modidy("whats the matter with kansas.") #== "whats eht matter htiw kansas."
# p bonus_modidy("whats  the    matter  with      kansas .") #== "whats eht matter htiw kansas."
# p bonus_modidy("whats  the    matter  with      kansas    .") #== "whats eht matter htiw kansas."
# p bonus_modidy("whats the matter with that kansas.")# == "whats eht matter htiw that sasnak."
# p bonus_modidy("whats the matter with that kansas  .") #== "whats eht matter htiw that sasnak."
# p bonus_modidy("") #== ""
# p bonus_modidy(".") #== "."
# p bonus_modidy("hello")# == "hello"
# p bonus_modidy("hello world.") #== "hello dlrow."
# p bonus_modidy("hello world .") #== "hello dlrow."
# p bonus_modidy("hello   world  .") #== "hello dlrow."
# p bonus_modidy("hello world  .") #== "hello dlrow."
# p bonus_modidy("hello world word.") #== "hello dlrow word."
