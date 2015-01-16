class CommentsController < ApplicationController

	before_action :authenticate!
	
	before_action :find_comment , only: [:show, :edit, :update, :upvote, :downvote, :complete]
	before_action :find_all, only: [:complete] 

def index
	@comments = Comment.all
end


def show
	 @vehicle_brand = VehicleBrand.find(params[:vehicle_brand_id])
	 @vehicle_name = VehicleName.find(params[:vehicle_name_id])
   @comments = Comment.where(vehicle_name_id: @vehicle_name).order("created_at DESC")
 
end



def new
	#@comment = Comment.new
	  @comment = current_manager_id.comments.new if current_manager
	  @comment = current_franqueado_id.comments.new if current_franqueado
	  @comment = current_vistoriadore_id.comments.new if current_vistoriadore
end

def create
@vehicle_brand = VehicleBrand.find(params[:vehicle_brand_id])
@vehicle_name = VehicleName.find(params[:vehicle_name_id])
@comment = current_manager.comments.new(comment_params) if current_manager
	 @comment = current_franqueado.comments.new(comment_params) if current_franqueado
	 @comment = current_vistoriadore.comments.new(comment_params) if current_vistoriadore


# @comment.manager_id = current_manager.id if current_manager
# @comment.franqueado_id = current_franqueado.id if current_franqueado
# @comment.vistoriadore_id = current_vistoriadore.id if current_vistoriadore


@comment.vehicle_name_id = @vehicle_name.id
	if @comment.save
	redirect_to vehicle_brand_vehicle_name_path(@vehicle_brand, @vehicle_name), notice: "Comentário cadastrado com sucesso" 
	else
	render 'new'
	end
end

def edit
end
def update
	@vehicle_brand = VehicleBrand.find(params[:vehicle_brand_id])
@vehicle_name = VehicleName.find(params[:vehicle_name_id])
	if @comment.update(comment_params)
		redirect_to vehicle_brand_vehicle_name_path(@vehicle_brand, @vehicle_name), notice: "Atualizado comentário com sucesso"
	else
		render 'show'
	end
end


def complete
	@ve
	@comment.update_attribute(:completed_at , Time.now)
	redirect_to vehicle_brand_vehicle_name_path(@vehicle_brand, @vehicle_name), notice: "Marcado como suporte realizado"
end







def upvote
	@comment.upvote_by current_manager
	@comment.upvote_by  current_franqueado
	@comment.upvote_by  current_vistoriadore
	redirect_to :back
end

def downvote
 @comment.downvote_by  current_manager
 @comment.downvote_by  current_franqueado
 @comment.downvote_by  current_vistoriadore
 redirect_to :back
end

# era assim
# @comment.downvote_by if current_manager
# @comment.downvote_by if current_franqueado
# @comment.downvote_by if current_vistoriadore



private

def find_all
	@vehicle_brand = VehicleBrand.find(params[:vehicle_brand_id])
	@vehicle_name = VehicleName.find(params[:vehicle_name_id])
	@comment = Comment.find(params[:id])

end


def find_comment
	@comment = Comment.find(params[:id])
end

def comment_params
	params.require(:comment).permit(:body, :vehicle_name_id, :manager_id, :franqueado_id, :vistoriadore_id, :image, :upvote, :downvote)
end





end
