class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
    has_many :groups
    has_many :operations

    validates :name, presence: true
    validates :role, inclusion: { in: %w[admin user], message: '%<value>s is not a valid role [admin, user]' }
end
