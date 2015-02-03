#encoding: utf-8
class MinistoragesController < ApplicationController
  
  before_action :set_ministorage, only: [:show]

  def index
    @ministorages = Ministorage.page(params[:page])
  end

  def show
    
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ministorage
    @ministorage = Ministorage.find(params[:id])
  end

end