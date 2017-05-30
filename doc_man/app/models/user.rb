class User < ApplicationRecord
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	  validates :first_name,{
  		length: { minimum: 3,  maximum: 30 },
  		presence: true
		}
  	validates :last_name,{
  		length: { minimum: 3,  maximum: 30 },
  		presence: true
		}
  	validates :email,{
  		length: { maximum: 50 } ,
  		presence: true,
  		uniqueness: true
		}
    has_many :document_accesses 
    has_many :documents

    def to_s
      return first_name + ' ' + last_name
    end

end
