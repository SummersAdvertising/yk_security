# encoding: utf-8
class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
    
#  validates_presence_of :password, :message => '密碼不得空白'
  
  validates :email,     :uniqueness => true,
                                  :format => { :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i, :message => 'E-Mail 格式不符'  }
  
  validates_uniqueness_of :email, :message => 'E-Mail 已有人使用。'
  
  # attr_accessible :title, :body
  
  
end
