module ApplicationHelper
	def link_to_icon(icon_name,path_or_url,options={})

		options.merge!({:class => "icon #{icon_name}"})
		link_to(image_tag("icons/#{icon_name}.png"),
				path_or_url,
				options)
	end
end
