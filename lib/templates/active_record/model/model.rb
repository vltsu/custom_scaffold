# encoding: UTF-8
class <%= class_name %> < <%= parent_class_name.classify %>
  cattr_reader :per_page
  @@per_page = 20
<% attributes.select {|attr| attr.reference? }.each do |attribute| -%>
  belongs_to :<%= attribute.name %>
<% end -%>
end
