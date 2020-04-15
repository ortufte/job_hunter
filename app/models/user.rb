class User < ApplicationRecord
    has_secure_password

    has_many :opportunities
    has_many :user_qualifications
    has_many :qualifications, through: :user_qualifications

    validates :name, :email, :password, presence: true, :on => :create
    validates :password, confirmation: true
    validates :password_confirmation, presence: true, :on => :create

end
