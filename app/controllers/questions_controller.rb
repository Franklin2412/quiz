class QuestionsController < ApplicationController
	 
	def new
		@question = Question.new
	end
	
	def create
		@question = Question.new(question_params)
		if @question.save
			redirect_to @question, notice: "Question created successfully!"
		else
			render 'new'
		end
	end

	def edit
		@question = Question.find(params[:id])
	end

	def update
		@question = Question.find(params[:id])
		if @question.update(question_params)
			redirect_to @question, notice: "Question updated successfully!"
		else
			render 'edit'
		end
	end
	
	def show
		@question = Question.find(params[:id])
	end
	
	def index
		@questions = Question.find(:all)
	end 

	def check
		@user = current_user
		@question = Question.find(params[:id])
		if @question.update(params.require(:question).permit(:user_answer))
			if @question.correct_answer == @question.user_answer
				@user.increment! :score, 1
				@user.increment! :total_score, 1
				redirect_to welcome_index_path
			else
				redirect_to welcome_index_path
				
			end
		else
			redirect_to root_path
		end
	end

	private

	def question_params
		params.require(:question).permit(:question, :answer1, :answer2, :answer3, :answer4, :correct_answer)
	end

end
