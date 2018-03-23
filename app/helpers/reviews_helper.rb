module ReviewsHelper
  def stars
    options_for_select((1..5).to_a.reverse)
  end
end