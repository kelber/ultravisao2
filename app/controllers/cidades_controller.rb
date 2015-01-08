class CidadesController < ApplicationController


		before_action :set_estado
		before_action :find_cidade, only: [:show, :destroy]


    def show
         # @cidades = @estado.cidades.order("created_at DESC")
        @cidades = @estado.cidades.order("name DESC")
        @lojas = @cidade.lojas.all
    end

    def new
       @cidade = Cidade.new
    end
    def create
       @cidade = Cidade.new(cidade_params)
    	 @cidade.estado_id = @estado.id
    	 if @cidade.save
    	 		redirect_to @estado
    	 		flash[:notice] = "Cidade cadastrada com sucesso"
    	 	else
    	 		flash[:error] = "erro ao cadastrar"
    	 		render 'new'
    	 end

    end



    def destroy
    	@estado = Estado.find(params[:estado_id])
    	if @cidade.destroy
    		redirect_to @estado, notice: "Deletado com sucesso"
    	else
    		flash[:error] = "Nao foi possivel excluir..."
    		render 'show'
    	end

    end



    private

    def find_cidade
    	 @cidade = Cidade.find(params[:id])
    end

    def set_estado
    	@estado = Estado.find(params[:estado_id])
    end

    def cidade_params
    	params.require(:cidade).permit(:name, :estado_id)
    end



end
