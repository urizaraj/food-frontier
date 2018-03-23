module ApplicationHelper
  def errors(resource)
    return render partial: 'layouts/error', locals: {resource: resource}
  end
end
