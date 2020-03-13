# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

game = United::Game.create(name: 'Entscheide Dich!')

questions_file_path = Rails.root.join('public', 'united_questions.txt')
questions = File.readlines(questions_file_path).map do |line|
  line.strip.split(' oder ').map do |question|
    question = "... #{question}?"
  end
end

questions.each do |question|
  United::Poll.create(
    game: game,
    question: 'Würdest Du lieber ...',
    answers: question.join('#')
  )
end
