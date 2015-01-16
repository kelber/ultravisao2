class WelcomeController < ApplicationController

  

  def index
    @comments = Comment.all.order("created_at DESC")
  # fiz para colocar valores no header
    @managers = Manager.all
    @franqueados = Franqueado.all
    @vistoriadores = Vistoriadore.all
   
  end

  def sobre
  end

  def lojas
  end

  def franquias
  end

  def ultrabook
  end
  
  def contato
  end







end
