module RatingsHelper
  def rating_to_button(rating)
    link_to rating.severity, rating_path(id: rating.id), class: 'btn-xs btn-primary'
  end
end
