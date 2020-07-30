class User < ApplicationRecord
    has_many :birthdays, dependent: :destroy
    has_many :reminders, through: :birthdays, dependent: :destroy
    has_many :gifts, through: :birthdays
    has_secure_password
    
    validates :username, :password, :email, presence: true
    validates :username, :email, uniqueness: true
    validates :password,  length: { minimum: 5 }, confirmation: true
    validates_format_of :email, :with => Devise::email_regexp
    

end
