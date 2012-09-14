class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :rg, :email, :cpf, :telefone, :name
  validates_uniqueness_of  :email, :cpf,  :case_sensitive => false

  has_many :houses
  
  has_many :sent_messages, :class_name => Message, :foreign_key => 'sender_id'
  has_many :received_messages, :class_name => Message, :foreign_key => 'recipient_id'

  # Setup accessible (or protected) attributes for your model
  attr_accessible :rg, :email, :cpf, :telefone,:name, :email, :password, :password_confirmation, :remember_me, :confirmed_at, 
    :avatar, :role
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  def all_messages
    sent_messages << received_messages
  end
  
  def conversation_with(user)
    Message.where("(sender_id=? AND recipient_id=?) 
      OR (recipient_id=? AND sender_id=?)", self.id, user.id, self.id, user.id).order("created_at DESC")
  end
  
  def admin?
    role == "admin"
  end
end
