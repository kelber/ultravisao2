class UltrabookController < ApplicationController
 
  before_action :authenticate_vistoriadore! || :authenticate_franqueado! ||  :authenticate_manager!

	before_action :find_comment , only: [:show, :edit, :update, :upvote, :downvote]


  def index
  	 	@vehicle_brand = VehicleBrand.all
  	 	@vehicle_name = VehicleName.all
  		@comments = Comment.all.order("created_at DESC")
  end

  def show
  end

  def edit
  end



private


def find_comment
	@comment = Comment.find(params[:comid])
end

def comment_params
	params.require(:comment).permit(:body, :vehicle_name_id, :manager_id, :franqueado_id, :vistoriadore_id, :image, :upvote, :downvote)
end





end
