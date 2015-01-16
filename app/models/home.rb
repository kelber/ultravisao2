class Home < ActiveRecord::Base


	scope :realizados, -> { where("completed_at  true") }


end



# <!-- 

#    <% if todo_item.completed_at.blank? %>



#  <% @managers.each do |m|  %>
#                 <p><%= m.name %> | <%= time_ago_in_words(m.created_at) %></p>
#                    <hr>
#               <% end %> -->