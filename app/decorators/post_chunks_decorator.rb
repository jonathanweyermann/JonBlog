class PostChunksDecorator < MainDecorator
  delegate_all

  def image
    to_cloudfront(object.image)
  end
end
