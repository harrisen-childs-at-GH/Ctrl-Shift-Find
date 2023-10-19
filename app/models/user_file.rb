class UserFile < ApplicationRecord
    belongs_to :repo, class_name: "Repo"
    has_many :gpt_model_requests, class_name: "Ai::GptModelRequest", dependent: :destroy
    enum programming_language: {ruby: 0, python: 1, java: 2}
    validates_presence_of :repo_id, :name, :path, :programming_language
end