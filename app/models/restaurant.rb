class Restaurant < ApplicationRecord
    validates :name, presence: true
    has_many :review, dependent: :destroy
end
