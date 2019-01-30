class PortfolioChunksDecorator < Draper::Decorator
  delegate_all

  def image
    if object.image.present?
      object.image
    else
      nil
    end
  end
end
