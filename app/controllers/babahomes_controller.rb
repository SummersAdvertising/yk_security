#encoding: utf-8
class BabahomesController < ApplicationController
  
  before_action :set_babahome, only: [:show]

  def index
    @babahomes = Babahome.page(params[:page])
  end

  def show
    
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_babahome
    @babahome = Babahome.find(params[:id])
  end

end