module RestaurantsHelper
  def render_menu_items(restaurant, symbol)
    render partial: 'menu_item', locals: {restaurant: restaurant, sym: symbol}
  end
end