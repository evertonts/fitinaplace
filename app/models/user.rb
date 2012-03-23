class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
         
  validates_presence_of :rg, :email, :cpf, :telefone,:name
  validates_uniqueness_of :rg, :email, :cpf, :telefone, :case_sensitive => false

  # Setup accessible (or protected) attributes for your model
  attr_accessible :rg, :email, :cpf, :telefone,:name, :email, :password, :password_confirmation, :remember_me, :confirmed_at
end
