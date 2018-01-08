class PostDecorator < Draper::Decorator
  delegate_all

  def posted_color
    object.visible? ? "green-background" : "red-background"
  end

  def image_present_color
    object.image.present? ? "green-background" : "red-background"
  end

  def publish_button
    object.production? ? "green-background" : "red-background"
  end

  def on_or_off
    object.production? ? "pubed" : "unpubed"
  end

  def enough_chars
    return "green-background" if object.body.length > 4000
    object.body.length < 2500 ? "red-background" : "orange-background"
  end
end
