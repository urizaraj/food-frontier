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

  def delete_link(resource)
    link_to resource, method: 'delete', data: { confirm: "Are you sure?" } do
      tag.i class: 'fas fa-trash'
    end
  end
end
