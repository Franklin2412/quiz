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
		@question = Question.find(params[:id])
		if @question.update(params.require(:question).permit(:user_answer))
			if @question.correct_answer == @question.user_answer
				flash[:success] = "Your Answer is Correct!, Try Next Question!"
				redirect_to root_path
				
			else
				
				flash[:failure] = "Sorry! Your answer is Wrong!. The correct answer is #{@question.correct_answer}, Try next question!."
				redirect_to root_path
				
			end
		end
	end

	private

	def question_params
		params.require(:question).permit(:question, :answer1, :answer2, :answer3, :answer4, :correct_answer)
	end

end
