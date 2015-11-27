module Features

  def display_completed_resource(resource)
    have_css '.bs-callout-complete h4', text: resource.title
  end

  def display_incompleted_resource(resource)
    have_css '.bs-callout-incomplete h4', text: resource.title
  end
end
