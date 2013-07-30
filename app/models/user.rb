class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                      :first_name, :last_name, :profile_name
  # attr_accessible :title, :body

  validates :profile_name, presence: true,
                           uniqueness: true,
                           format: {
                            with: /\A[a-zA-Z\-\_]+\Z/,
                            message: "must be formatted correctly."
                           }
  has_many :posts
  has_many :comments
end
