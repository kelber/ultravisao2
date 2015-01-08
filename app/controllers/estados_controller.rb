class EstadosController < ApplicationController

    before_action :find_estado , only: [:show, :destroy]

    def index
        @estados = Estado.all
    end

    def show    
    end

    def new
        @estado = Estado.new
    end

    def create
        @estado = Estado.new(estado_params)
        if @estado.save
            redirect_to @estado, notice: "Estado cadastrado com sucesso"
        else
            render 'new'
        end
    end

    def destroy
        if @estado.destroy
            redirect_to estados_path, notice: "Estado excluido com sucesso"
        else
            render 'show'
        end
    end

    private

    def find_estado
        @estado = Estado.find(params[:id])
    end

    def estado_params
        params.require(:estado).permit(:name)
    end



end
