class AddTotalScoresToUsers < ActiveRecord::Migration
  def change
    add_column :users, :total_score, :integer, default: 0
  end
end
