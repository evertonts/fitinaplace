class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :rg, :email, :cpf, :telefone,:name
  validates_uniqueness_of  :email, :cpf,  :case_sensitive => false

  has_many :houses
  has_many :comments
  has_many :ratings

  # Setup accessible (or protected) attributes for your model
  attr_accessible :rg, :email, :cpf, :telefone,:name, :email, :password, :password_confirmation, :remember_me, :confirmed_at, 
    :avatar, :role
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" },
    :default_url => '/assets/notFound.png'
  
  def admin?
    role == "admin"
  end
end
