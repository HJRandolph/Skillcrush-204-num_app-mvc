class Person < ActiveRecord::Base
	
	validates_presence_of :birthdate, :first_name, :last_name
	 
	def self.get_birth_path_num(birthdate)
#determine the numerology number for the birthdate
	number = birthdate[0].to_i + birthdate[1].to_i + birthdate[2].to_i + birthdate[3].to_i + birthdate[4].to_i + birthdate[5].to_i + birthdate[6].to_i + birthdate[7].to_i
	number = number.to_s
	number = number[0].to_i + number[1].to_i

	if number > 9 
		number = number.to_s
		number = number[0].to_i + number[1].to_i
	end
return number
end

#output the explanation of the number(s)
def self.get_message(birth_path_num)
	case birth_path_num
	when 1
	message =  "<p>Your numerology number is #{birth_path_num}.</p><p>One is the leader. The number one indicates the ability to stand alone, and is a strong vibration. Ruled by the Sun.</p>"
	when 2
	message =  "<p>Your numerology number is #{birth_path_num}.</p><p>This is the mediator and peace-lover. The number two indicates the desire for harmony. It is a gentle, considerate, and sensitive vibration. Ruled by the Moon.</p>"
	when 3
	message =  "<p>Your numerology number is #{birth_path_num}.</p><p>Number Three is a sociable, friendly, and outgoing vibration. Kind, positive, and optimistic, Three's enjoy life and have a good sense of humor. Ruled by Jupiter.</p>"
	when 4
	message =  "<p>Your numerology number is #{birth_path_num}.</p><p>This is the worker. Practical, with a love of detail, Fours are trustworthy, hard-working, and helpful. Ruled by Uranus.</p>"
	when 5
	message =  "<p>Your numerology number is #{birth_path_num}.</p><p>This is the freedom lover. The number five is an intellectual vibration. These are 'idea' people with a love of variety and the ability to adapt to most situations. Ruled by Mercury.</p>"
	when 6
	message =  "<p>Your numerology number is #{birth_path_num}.</p><p>This is the peace lover. The number six is a loving, stable, and harmonious vibration. Ruled by Venus.</p>"
	when 7
	message =  "<p>Your numerology number is #{birth_path_num}.</p><p>This is the deep thinker. The number seven is a spiritual vibration. These people are not very attached to material things, are introspective, and generally quiet. Ruled by Neptune.</p>"
	when 8
	message =  "<p>Your numerology number is #{birth_path_num}.</p><p>This is the manager. Number Eight is a strong, successful, and material vibration. Ruled by Saturn.</p>"
	when 9
	message =  "<p>Your numerology number is #{birth_path_num}.</p><p>This is the teacher. Number Nine is a tolerant, somewhat impractical, and sympathetic vibration. Ruled by Mars.</p>"
	else  message =  "How is this possible?"
	end
end 



def self.valid_birthdate(input)
	if (input.length == 8 && !input.match(/^[0-9]+[0-9]$/).nil?)
		return true
	else
		return false
	end
	end
end

def self.first_name(input)
	
end

def self.last_name(input)
	
end
