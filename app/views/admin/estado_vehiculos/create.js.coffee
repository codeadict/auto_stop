$('#crud_modal ul.errors').html ''
<% if @estado.errors.any? %>
<% @estado.errors.full_messages.each do |message| %>
$('#crud_modal ul.errors').append $('<li />').html('<%= message.html_safe %>')
<% end %>
<% else %>
$("#crud_modal").modal("hide")
<% end %>
