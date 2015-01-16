class HomeController < ApplicationController


  def index
  	  @comments_resolvidos = Comment.all.where("completed_at true")
  	
  
  	
  end

  def show
  end

  def edit
  end
end
