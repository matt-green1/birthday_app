class User < ApplicationRecord
    has_many :birthdays, dependent: :destroy
    has_many :reminders, through: :birthdays, dependent: :destroy

    has_secure_password
    
    validates :username, :password_digest, :email, presence: true
    validates :username, :email, uniqueness: true
    validates :password_digest,  length: { minimum: 5 }
    validates_format_of :email, :with => Devise::email_regexp
    
    #custom
   #  validate :check_email
    #  def check_email
    #      valid_email = ["@gmail.com", "@yahoo.com", "@aol.com", "@gmail.com", "@outlook.com"]
   #     if self.email.end_with?
   #         self.errors.add(:email, "Please enter a valid email address")
   #     end
   # end
end
