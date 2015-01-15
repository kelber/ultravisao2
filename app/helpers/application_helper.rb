module ApplicationHelper


	 def full_name
   		current_manager.email + " ( " "#{current_manager.name}"  " )"
   end

   
   def full_franqueado
   		current_franqueado.email  +  " ( " " #{current_franqueado.name}" " )"
   end

   def full_vistoriador
   		current_vistoriadore.email +  " ( " " #{current_vistoriadore.name}" " )" 
   end	



    def index
    @comments = Comment.all.order("created_at DESC")
  # fiz para colocar valores no header
  end

end
