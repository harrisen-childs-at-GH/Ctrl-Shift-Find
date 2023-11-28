class Ai::GptModelRequest < ApplicationRecord
    belongs_to :user_file, class_name: "UserFile"
    has_one :response, class_name: "Ai::GptModelResponse", foreign_key: "request_id", dependent: :destroy
    enum status: {pending: 0, in_progress: 1, success: 2, error: 3}
    validates_presence_of :status, :prompt, :question
end
