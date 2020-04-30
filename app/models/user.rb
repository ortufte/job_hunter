class User < ApplicationRecord
    has_secure_password

    has_many :opportunities
    has_many :tasks, through: :opportunities
    has_many :user_qualifications
    has_many :qualifications, through: :user_qualifications

    validates :name, :email, :password, presence: true, :on => :create
    validates :password, confirmation: true
    validates :password_confirmation, presence: true, :on => :create

    def qualifications_attributes=(qualification_attributes)
        qualification_attributes.values.each do |qualification_attribute|
            new_qual = Qualification.find_or_create_by(qualification_attribute) if !qualification_attribute[:description].empty?
            if new_qual
                self.qualifications << new_qual
            end
        end
    end

    def self.find_or_create_from_auth_hash(auth)
		where(email: auth.extra.id_info.email).first_or_initialize.tap do |user|
			user.name = auth.extra.id_info.name
            user.email = auth.extra.id_info.email
            user.password = SecureRandom.hex
            user.password_confirmation = user.password
			user.save!
		end
    end
    
   




end

