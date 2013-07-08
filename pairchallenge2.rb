def get_question
	puts "Please enter a question."
	question = gets.chomp
	if question == ""
		puts "Please enter something as a question."
		question = get_question
	end

	question
end

def question_answer
	puts "Please enter an answer"
	answer = gets.chomp.downcase
	if answer == ""
		puts "Please enter something as an answer."
		answer = question_answer
	end

	answer
end

def ask_answer
	answer = gets.chomp.downcase
	if answer == ""
		puts "Please put something as an answer."
		answer = ask_answer
	end

	answer
end



50.times {puts}
qna=[]
another_question = true

while another_question
	puts "Do you want to add a question and answer pair? (y/n)"
	another_question = gets.chomp.downcase
	if another_question == 'y'
		qna.push([get_question, question_answer])
		puts
	else
		another_question = false
	end

end

points_counter = 0
#qna = [["Where are you from?","sudbury"], ["What is your favorite color?", "blue"], ["What is your favorite hobby?", "skiing"],["What is your favorite subject in school?", "science"],["What was your favorite book from the Launch Academy reading list?", "pragmatic learning"]]
50.times {puts}
total_possible_points = qna.length
puts "Now pass to your partner and have them press enter to start the inquisition ........"
wait_for_partner = gets.chomp

if qna.length > 2
	total_possible_points = qna.length - 2
	puts "Since you entered #{qna.length} questions, I am going to randomly ask you #{qna.length-2} of them"

	while qna.length > 2
		question_index = rand(qna.length)
		puts qna[question_index][0]
		user_answer = ask_answer
		answer = qna[question_index][1]

		if user_answer == answer
			puts "That is correct, you earn 1 point."
			points_counter += 1
			puts "Your total is #{points_counter}"
			puts
		else
			puts "You answer is wrong. Your score is #{points_counter}."
			puts points_counter
		end
		qna.delete_at(question_index)

	end

elsif qna.length == 2
	total_possible_points = qna.length
	puts "since you only entered 2 questions, I am going to ask you the two in random order"
	question_index = rand(2)
	puts qna[question_index][0]
	user_answer = ask_answer
	answer = qna[question_index][1]

	if user_answer == answer
		puts "That is correct, you earn 1 point."
		points_counter += 1
		puts "Your score is #{points_counter}"
	else
		puts "You answer is wrong. Your score is #{points_counter}."
		puts points_counter
	end

	qna.delete_at(question_index)
	puts qna[0][0]
	user_answer = ask_answer
	answer = qna[0][1]

	if user_answer == answer
		puts "That is correct, you earn 1 point."
		points_counter += 1
		puts "Your score is #{points_counter}"
		puts
	else
		puts "You answer is wrong. Your score is #{points_counter}."
		puts
	end

else
	puts "You did not enter enough questions"
	points_counter = -1
end


if points_counter == 0
	puts "You didn't answer any questions correctly or earn any points, shame on you."
elsif points_counter == total_possible_points
	puts "Wow, you really know me. You answered all the questions correctly."
elsif points_counter == -1
	puts "Too bad, you didn't even get up to the plate"
else
	puts "You scored #{points_counter} points. Thanks for getting to know me."
end