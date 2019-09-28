class PortfoliosDecorator < Draper::CollectionDecorator
  def visible_portfolios
    h.render partial: 'portfolio_slice', collection: slices, as: :slice
  end

  private

  def slices
    self.each_slice(3).map {|x| x }
  end
end
