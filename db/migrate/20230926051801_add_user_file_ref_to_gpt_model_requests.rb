class AddUserFileRefToGptModelRequests < ActiveRecord::Migration[7.0]
  def change
    add_reference :ai_gpt_model_requests, :user_file, foreign_key: {to_table: :user_files}
  end
end
