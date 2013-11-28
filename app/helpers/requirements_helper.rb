module RequirementsHelper
	def link_to_remove_fields(*args, &block)
  if block_given?
    element = args.first || {}
    html_options = args.second
    link_to_remove_fields(capture(&block), element, html_options)
  else
    name = args[0]
    element = args[1]
    html_options = args[2] || {}
    element.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)", html_options)
  end
end
end
