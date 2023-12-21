class User < ApplicationRecord
    has_secure_password
    has_many :articles, dependent: :destroy
    has_many :likes,dependent: :destroy
    has_many :comments,dependent: :destroy
    validates :user_name, presence: true
    validates :email, presence: true
    validates :email, presence: true
end
