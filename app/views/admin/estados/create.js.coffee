$('#crud_modal ul.errors').html ''
<% if @estado.errors.any? %>
<% @estado.errors.full_messages.each do |message| %>
$("#crud_modal ul.errors").append $('<li/>').html "<%= message.html_safe %>"
$('.error_box').show()
<% end %>
<% else %>
$('#estados_list').html '<%= j render 'estados', estados: @estados %>'
$("#crud_modal").modal("hide")
<% end %>
