class Repo < ApplicationRecord
    has_many :user_files, class_name: "UserFile", dependent: :destroy
    belongs_to :user, class_name: "User"
    validates_presence_of :user_id
end
