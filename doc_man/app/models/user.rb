class User < ApplicationRecord
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
end
