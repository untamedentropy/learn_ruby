#write your code here
def letter_type(s)

	vowels = ["a", "e", "i", "o", "u"]

	special_consonants =  ["qu", "sch"]

	letters = s#.split(//)


	two_letters = letters.take(2)
	three_letters = letters.take(3)


	if vowels.include?(letters[0])
		return [0, 1]
	
	elsif special_consonants.include?(two_letters.join)
		return [1, 2]
			
	elsif special_consonants.include?(three_letters.join)
		return [1, 3]
	else
		return [2, 1]

	end
end






def translate(s)

	#puts s

	words = s.split()

	#puts words

	pig_latin = ""
	pig_ending = "ay"

	words.length.times do |i|

		letters = words[i].split(//)
		#puts letters
		working_letters = letters
		transpose = 0
		skip = 0

		catch :done do
			letters.length.times do |j|

				substring = working_letters.take(3)

				letter_type = letter_type(substring)

				if skip > 1
					skip -= 1

				elsif letter_type[0] == 0
					#Vowel

					throw :done

				elsif letter_type[0] == 1
					#special 

					skip = letter_type[1]
					puts skip
					transpose += skip

				elsif letter_type[0] == 2
					#consonant

					transpose += 1

				else throw :done

				end

				working_letters = letters.drop(j+1)
			end

		end
		puts transpose
		pig_word = [letters.drop(transpose)].join + [letters.take(transpose)].join + pig_ending

		#puts "aa" + pig_word

		if i == 0
			pig_latin += pig_word
		else pig_latin += " " + pig_word
		end


	end



	return pig_latin



end