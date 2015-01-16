class VehicleNamesController < ApplicationController

  before_action :authenticate!

	before_action :set_vehicle_brand
	before_action :find_vehicle_name, only: [:show, :edit, :update, :destroy]


  def show
   @vehicle_name = VehicleName.find(params[:id])
   @comments = Comment.where(vehicle_name_id: @vehicle_name).order("created_at DESC")
  # @comment.manager_id = current_manager.id if current_manager
   #@comment.franqueado_id = current_franqueado.id if current_franqueado
  # inventei @comment.vistoriadore_id = current_vistoriadore.id if current_vistoriadore
  end

  def edit
  	# @vehicle_name = VehicleName.find(params[:id])
  end

  def new
  	@vehicle_name = VehicleName.new
  end

  def create
  	@vehicle_name = VehicleName.new(vehicle_name_params)
  	@vehicle_name.vehicle_brand_id = @vehicle_brand.id
  	if @vehicle_name.save 
  		redirect_to @vehicle_name.vehicle_brand, notice: "Veiculo cadastrado com sucesso"
  	else
  		render 'new'
  	end
  end

  def update
  	# @vehicle_name = VehicleName.find(params[:id])
		@vehicle_name.vehicle_brand_id = @vehicle_brand.id
  	if @vehicle_name.update(vehicle_name_params)
  		redirect_to @vehicle_name.vehicle_brand, notice: "Veiculo atualizado com sucesso"
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@vehicle_brand = VehicleBrand.find(params[:vehicle_brand_id])  	
  	if @vehicle_name.destroy
  		redirect_to vehicle_brands_path , notice: "Deletado com sucesso"
  	else
  		render 'show'
  	end
  end




  private

  def find_vehicle_name
  	 @vehicle_name = VehicleName.find(params[:id])
  end

  def set_vehicle_brand
  	@vehicle_brand = VehicleBrand.find(params[:vehicle_brand_id])
  end

 

  def vehicle_name_params
  	params.require(:vehicle_name).permit(:name, :vehicle_brand_id, :year, :obs)
  end





end
