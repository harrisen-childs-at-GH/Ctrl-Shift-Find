class CreateUserFiles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_files do |t|
      t.string :name
      t.string :path
      t.integer :programming_language
      t.references :repo, null: false, foreign_key: {to_table: :repos}

      t.timestamps
    end
  end
end
