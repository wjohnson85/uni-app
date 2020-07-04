class Student < ApplicationRecord
    before_save { self.email = email.downcase }
    validates :name, presence: true, length: { minimum: 5, maximum: 40 }
    # constant to store regex
    VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
      # validates that there is an email and there isn't a match regardless of case and a maximum length & correct email format with regex
    validates :email, presence: true, 
                        uniqueness: { case_sensitive: false}, 
                        length: { maximum: 105 }, 
                        format: { with: VALID_EMAIL_REGEX }
    has_secure_password
    has_many  :student_courses
    has_many  :courses, through: :student_courses                 
end