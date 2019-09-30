class PortfolioDecorator < Draper::Decorator
  delegate_all

  def posted_color
    object.visible? ? "green-background" : "red-background"
  end

  def image_present_color
    object.image.present? ? "green-background" : "red-background"
  end

  def publish_button
    object.is_published? ? "green-background" : "red-background"
  end

  def on_or_off
    object.is_published? ? "pubed" : "unpubed"
  end

  def enough_chars
    return "green-background" if object.description.length > 4000
    object.description.length < 2500 ? "red-background" : "orange-background"
  end

  def main_image
    if object.link.present?
      h.link_to h.image_tag(object.image.url(:medium), width: '100%'), object.link
    else
      h.image_tag object.image.url, width: '100%'
    end
  end

  def technology_description
    ActionView::Base.full_sanitizer.sanitize(object.description).split('|')
  end

  def decorated_portfolio_chunks
    PortfolioChunksDecorator.decorate_collection(object.portfolio_chunks)
  end

  def show_link
    if object.link.present?
      h.link_to 'View Live Site', object.link, class: 'btn btn-primary btn-lg center'
    end
  end

  def currently_active(index)
    'active' if h.params[:project_id].to_i==index
  end

  def mouse_over_text
    portfolio_chunks.first.try(:description).try(:truncate, 240)
  end
end
