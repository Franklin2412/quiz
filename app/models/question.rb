class Question < ActiveRecord::Base

	validates :question, presence: true, uniqueness: { case_sensitive: true }
	validates :answer1,  presence: true
	validates :answer2,  presence: true
	validates :answer3,  presence: true
	validates :answer4,  presence: true
	validates :correct_answer, presence: true
end
