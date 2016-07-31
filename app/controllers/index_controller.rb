require 'sinatra'

def get_birth_path_num(birthdate)
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
def get_message(birth_path_num)

	case birth_path_num
	when 1
	@message =  "Your numerology number is #{birth_path_num}.<br /><br />One is the leader. The number one indicates the ability to stand alone, and is a strong vibration. Ruled by the Sun."
	when 2
	@message =  "Your numerology number is #{birth_path_num}.<br /><br />This is the mediator and peace-lover. The number two indicates the desire for harmony. It is a gentle, considerate, and sensitive vibration. Ruled by the Moon."
	when 3
	@message =  "Your numerology number is #{birth_path_num}.<br /><br />Number Three is a sociable, friendly, and outgoing vibration. Kind, positive, and optimistic, Three's enjoy life and have a good sense of humor. Ruled by Jupiter."
	when 4
	@message =  "Your numerology number is #{birth_path_num}.<br /><br />This is the worker. Practical, with a love of detail, Fours are trustworthy, hard-working, and helpful. Ruled by Uranus."
	when 5
	@message =  "Your numerology number is #{birth_path_num}.<br /><br />This is the freedom lover. The number five is an intellectual vibration. These are 'idea' people with a love of variety and the ability to adapt to most situations. Ruled by Mercury."
	when 6
	@message =  "Your numerology number is #{birth_path_num}.<br /><br />This is the peace lover. The number six is a loving, stable, and harmonious vibration. Ruled by Venus."
	when 7
	@message =  "Your numerology number is #{birth_path_num}.<br /><br />This is the deep thinker. The number seven is a spiritual vibration. These people are not very attached to material things, are introspective, and generally quiet. Ruled by Neptune."
	when 8
	@message =  "Your numerology number is #{birth_path_num}.<br /><br />This is the manager. Number Eight is a strong, successful, and material vibration. Ruled by Saturn."
	when 9
	@message =  "Your numerology number is #{birth_path_num}.<br /><br />This is the teacher. Number Nine is a tolerant, somewhat impractical, and sympathetic vibration. Ruled by Mars."
	else  @message =  "How is this possible?"
	end
end 

def valid_birthdate(input)
	if input.length == 8 && input.match(/^[0-9]+[0-9]$/)
		return true
	else
		return false
	end
end

def setup_index_view
	birthdate = params[:birthdate].gsub("-","")
	if valid_birthdate(birthdate)
		birth_path_num = get_birth_path_num(birthdate)
		redirect "/message/#{birth_path_num}"
		@message = get_message(birth_path_num)
	else
		@error = "You should enter a valid birthdate in the form of mmddyyyy."
		erb :form
	end
end

get '/' do
	erb :form
end

post '/' do
	setup_index_view
	erb :index
end

get '/message/:birth_path_num' do
	birth_path_num = params[:birth_path_num].to_i
	@message = get_message(birth_path_num)	
		@predicate = "<h1>Your numerology number means...</h1>"
	erb :index
end

get '/:birthdate' do
	setup_index.view
	erb :index
end

#trying to figure out how to make the message appear using the above case when rather than building an array to call on
#get '/newpage' do	
#	n = 1
#	if n < 10
#		@message = get_message(birth_path_num)
#		erb :index
#		n + 1
#	end
#end

get '/' do
	"Hello World"
end

