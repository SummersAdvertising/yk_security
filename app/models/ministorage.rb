#encoding: utf-8
class Ministorage < ActiveRecord::Base
  include PeditorParser 
  
  belongs_to :article, :dependent => :destroy
  
  default_scope { order('city ASC, district ASC') }
  
  before_validation :check_attrs
  validates_presence_of :name 

  paginates_per 10

  def check_attrs
    self.name = "未命名迷你倉" if self.name.blank?
  end

end
