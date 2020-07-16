class User < ActiveRecord::Base
    validates :name, presence: true
    validates :email, presence: true
    validates :username, presence: true
    validates_uniqueness_of :username
    validates :password_digest, presence: true
    has_secure_password
    
end