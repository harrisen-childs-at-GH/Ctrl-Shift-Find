class User < ApplicationRecord
    has_many :repos, class_name: "Repo", dependent: :destroy
    validates_presence_of :username
end
