class VehicleBrandsController < ApplicationController

  before_action :authenticate!
  

  before_action :find_vehicle_brand, only: [:show, :edit, :update, :destroy] 

  def index
    @vehicle_brands = VehicleBrand.all.order("name ASC")
   # @vehicle_names = VehicleName.all --> caso use count para registros
  end

  def show
     @vehicle_names = @vehicle_brand.vehicle_names.order("created_at DESC")
  end

  def new
  	@vehicle_brand = VehicleBrand.new
  end

  def create
  	@vehicle_brand = VehicleBrand.new(vehicle_brand_params)
    if @vehicle_brand.save
        redirect_to @vehicle_brand, notice: "Marca cadastrada com sucesso"
    else
        render 'new'
    end
  end


  def edit
  end

  def update
    if @vehicle_brand.update(vehicle_brand_params)
      redirect_to @vehicle_brand, notice: "Atualizado com sucesso"
    else
      render 'edit'
    end
  end



  private

  def find_vehicle_brand
  	@vehicle_brand = VehicleBrand.find(params[:id])
  end

  def vehicle_brand_params
  	params.require(:vehicle_brand).permit(:name)
  end



end
