class WelcomeController < ApplicationController
  	def index
  		@questions = Question.where(id: Question.pluck(:id).sample(1))
  	end

  
end
