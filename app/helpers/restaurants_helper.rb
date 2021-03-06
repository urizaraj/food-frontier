module RestaurantsHelper
  def render_menu_items(restaurant, symbol)
    render partial: 'menu_item', locals: {restaurant: restaurant, sym: symbol}
  end

  def render_rating(restaurant)
    restaurant.rating.zero? ? tag.small('no reviews') : restaurant.rating.round(2)
  end

  def disp_price(menu_item)
    "$#{menu_item.price}" if menu_item.price
  end
end