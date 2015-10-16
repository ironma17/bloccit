module RatesHelper
  def rating_to_button(rates)
    link_to rates.name, rate_path(id: rate.id), class: 'btn-xs btn-primary'
  end
end
