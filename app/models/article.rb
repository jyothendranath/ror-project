class Article < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :likes,dependent: :destroy
    has_many :comments,dependent: :destroy
    validates :title, presence: true
    validates :text, presence: true
    validates :description, presence: true
end
