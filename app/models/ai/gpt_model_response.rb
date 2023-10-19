class Ai::GptModelResponse < ApplicationRecord
  belongs_to :request, class_name: "Ai::GptModelRequest"
  validates_presence_of :request_id
end
