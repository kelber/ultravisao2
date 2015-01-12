class CommentsController < ApplicationController

	before_action :find_comment , only: [:show, :edit, :update, :upvote, :downvote]


def show
	@vehicle_brand = VehicleBrand.find(params[:vehicle_brand_id])
	# @vehicle_name = VehicleName.find(params[:vehicle_name_id])
end



def new
	@comment = Comment.new
end

def create
@vehicle_brand = VehicleBrand.find(params[:vehicle_brand_id])
@vehicle_name = VehicleName.find(params[:vehicle_name_id])
@comment = Comment.new(comment_params)
@comment.manager_id = current_manager.id if current_manager
@comment.franqueado_id = current_franqueado.id if current_franqueado
@comment.vistoriadore_id = current_vistoriadore.id if current_vistoriadore
@comment.vehicle_name_id = @vehicle_name.id

@comment.vehicle_name_id = @vehicle_name.id
if @comment.save
redirect_to vehicle_brand_vehicle_name_path(@vehicle_brand, @vehicle_name), notice: "Cadastrado comentário com sucesso" 
else
render 'new'
end
end

def edit
end
def update
	if @comment.update(comment_params)
		redirect_to vehicle_brand_vehicle_name_path(@vehicle_brand, @vehicle_name), notice: "Atualizado comentário com sucesso"
	else
		render 'show'
	end
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


def find_comment
	@comment = Comment.find(params[:id])
end

def comment_params
	params.require(:comment).permit(:body, :vehicle_name_id, :manager_id, :franqueado_id, :vistoriadore_id, :image, :upvote, :downvote)
end





end
