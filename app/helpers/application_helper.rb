module ApplicationHelper


	 def full_name
   		current_manager.email + " ( " "#{current_manager.name}"  " )"
   end

   
   def full_franqueado
   		current_franqueado.email  +  " ( " " #{current_franqueado.name}" " )"
   end

   # def full_namevistoriador
   # 		current_vistoriadore.name 
   # end	


end
