users = [
	{username: "mauricio", password: "password1"},
	{username: "jack", password: "password2"},
	{username: "jonshow", password: "password3"},
	{username: "heisenberg", password: "password4"}
]

def auth_user(usern, passw, list_of_users)
	list_of_users.each do |user_record|
		if user_record[:username] == usern && user_record[:password] == passw
			return user_record   #return eliminates the need of use 'break'
		end	
	end
	"Credentials were not correct" #in ruby the last of return is implicit
end

puts "Welcome to the authenticator!"
25.times{print "-"}
puts
puts "This program will take input from the user and compare password"
puts "If password is correct, you will get back the user object"

attempts = 1
while attempts < 4
	print "Username:"
	usern = gets.chomp
	print "Password:"
	require 'io/console'
	passw = STDIN.noecho(&:gets).chomp
	authentication = auth_user(usern, passw, users)
	puts authentication
	puts "Press q to quit, or any other key to continue: "
	input = gets.chomp.downcase
	break if input == "q"  #this works like a normal 'if', but it's written in one line, so is better. 
	attempts += 1
end
puts "You have exceeded the limit of attempts" if attempts == 4