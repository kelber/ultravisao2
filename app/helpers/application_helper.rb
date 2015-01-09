module ApplicationHelper


	 def full_name
   		current_manager.email + " ( " "#{current_manager.name}"  " )"
   end

   
end
