class HomeController < ApplicationController

	before_action :authenticate_vistoriadore! || :authenticate_franqueado! ||  :authenticate_manager!

  def index
  	  @comments_resolvidos = Comment.all.where("completed_at true")
  end

  def show
  end

  def edit
  end
end
