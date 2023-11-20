class User < ApplicationRecord
    has_many :groups
    has_many :operations

    validates :name, presence: true
end
