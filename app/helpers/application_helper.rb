module ApplicationHelper

  def form_errors_for(resource)
    if resource.errors.any?
      content_tag :ul do
        resource.errors.full_messages.each do |msg|
          concat(content_tag(:li, msg))
        end
      end
    end
  end
end
