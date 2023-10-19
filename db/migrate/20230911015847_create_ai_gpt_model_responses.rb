class CreateAiGptModelResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :ai_gpt_model_responses do |t|
      t.string :payload
      t.references :request, null: false, foreign_key: {to_table: :ai_gpt_model_requests}

      t.timestamps
    end
  end
end
