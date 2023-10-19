class CreateAiGptModelRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :ai_gpt_model_requests do |t|
      t.integer :status
      t.string :prompt

      t.timestamps
    end
  end
end
