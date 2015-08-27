$("ul.errors").html ''
<% if @vehiculo.errors.any? %>
<% @vehiculo.errors.full_messages.each do |message| %>
$("#crud_modal ul.errors").append $('<li/>').html "<%= message.html_safe %>"
$('.error_box').show()
<% end %>
<% else %>
<% if @from_autocomplete %>
$autoc = $('#<%= @autocomplete_id %>')
$autoc.val '<%= @entity.display_name %>'
$autoc.parent().parent().siblings('form').find('#entity').val <%= @entity.id %>
$autoc.parent().parent().siblings('form').find('.show-on-complete').fadeIn()
$contactinfo = $autoc.parent().parent().siblings('form').find('.show-on-complete').children('.selected-information')
$contactinfo.find('#company-name').html '<%= @entity.display_name %>'
$contactinfo.find('#contact_name').html '<%= @entity.contact_name %>'
$contactinfo.find('#phone').html '<%= @entity.phone %>'
$autoc.parent().parent().siblings('form').find('.btn-primary').show()
$autoc.parent().parent().siblings('form').find('input').filter(':visible:first').focus()
<% else %>
$("#vehicles_content").html "<%= j(render 'list') %>"
<% end %>
$("#crud_modal").modal 'hide'
<% end %>