module ApplicationHelper
  def errors(resource)
    render partial: 'layouts/error', locals: {resource: resource}
  end

  def render_stars(i)
    render partial: 'reviews/stars', locals: {i: i.floor}
  end

  def admin?
    user_signed_in? ? current_user.admin : false
  end
end
