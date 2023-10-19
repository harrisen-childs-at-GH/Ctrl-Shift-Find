class User < ApplicationRecord
    has_many :repos, class_name: "Repo", dependent: :destroy
end
