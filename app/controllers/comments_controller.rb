class CommentsController < ApplicationController

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


private

def comment_params
	params.require(:comment).permit(:body, :vehicle_name_id, :manager_id, :franqueado_id, :vistoriadore_id)
end





end
