$('#crud_modal ul.errors').html ''
<% if @ejecutivo.errors.any? %>
<% @ejecutivo.errors.full_messages.each do |message| %>
$("#crud_modal ul.errors").append $('<li/>').html "<%= message.html_safe %>"
$('.error_box').show()
<% end %>
<% else %>
$('#ejecutivos_list').html '<%= j render 'ejecutivos', ejecutivos: @ejecutivos %>'
$("#crud_modal").modal("hide")
<% end %>
