class AddQuestionToGptModelRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :ai_gpt_model_requests, :question, :string
  end
end
