require 'sinatra'


#get '/' do
#"hello world!"
#end

def valid_birthdate(input)
	if input.length == 8 && input.match(/^[0-9]+[0-9]$/)
		return true
	else
		return false
	end
end

def setup_index_view
	
		@message = get_message(birth_path_num)	
		erb :index
	
end

get '/newpage/' do
	erb :newpage
end

get '/' do
	erb :form
end

post '/' do
	birthdate = params[:birthdate].gsub("-","")
	if valid_birthdate(birthdate)
		birth_path_num = get_birth_path_num(birthdate)
		redirect "/message/#{birth_path_num}"
		@message = get_message(birth_path_num)	
		erb :index
	else
		@error = "You should enter a valid birthdate in the form of mmddyyyy."
		erb :form
	end

end

get '/message/:birth_path_num' do
	birth_path_num = params[:birth_path_num].to_i
	@message = get_message(birth_path_num)	
		#@predicate = "<h4>Your numerology number...</h4>"
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

