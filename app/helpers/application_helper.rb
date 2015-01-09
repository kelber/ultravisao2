module ApplicationHelper


	 def full_name
   		current_manager.email + " ( " "#{current_manager.name}"  " )"
   end

   
   # def full_namevistoriador
   # 		current_vistoriadore.name 
   # end	


end
