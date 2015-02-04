#encoding: utf-8
class IntroPage < ActiveRecord::Base
  include ParsePeditor 

  belongs_to :article, :dependent => :destroy

  paginates_per 10

  after_create :create_article

  def create_article
    self.article = Article.new
    self.save
  end

end
