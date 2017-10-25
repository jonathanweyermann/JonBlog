class PostDecorator < Draper::Decorator
  delegate_all

  def posted_color
    object.visible? ? "green-background" : "red-background"
  end

  def publish_button
    object.production? ? "green-background" : "red-background"
  end

  def on_or_off
    object.production? ? "pubed" : "unpubed"
  end
end
