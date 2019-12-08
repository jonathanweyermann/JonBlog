class PortfolioChunksDecorator < MainDecorator
  delegate_all

  def image
    if object.image.present?
      to_cloudfront(object.image)
    else
      nil
    end
  end
end
