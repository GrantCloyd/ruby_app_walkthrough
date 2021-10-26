class User < ApplicationRecord 
    validates :email, presence: true, uniqueness: true, length: {maximum: 105}, format: {with: URI::MailTo::EMAIL_REGEXP}
    validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3 ,maximum: 25}
    has_many :articles
end