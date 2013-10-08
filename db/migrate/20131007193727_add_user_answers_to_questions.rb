class AddUserAnswersToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :user_answer, :string
  end
end
