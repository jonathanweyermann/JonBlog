class PostsDecorator < Draper::CollectionDecorator
  def visible_posts
    if any_posts?
      h.render partial: 'posts/post_slice', collection: slices, as: :slice
    else
      h.raw "<p> No Posts yet </p>"
    end
  end

  def visible_except_current(current_id)
    if any_posts?
      h.render partial: 'posts/post_slice', collection: exception_slice(current_id), as: :slice
    else
      h.raw "<p> No Posts yet </p>"
    end
  end

  def pagination_bar
    h.render partial: 'partials/pagination_bar', locals: { paginatable: object } if any_posts?
  end

  private

  def any_posts?
    object.any?
  end

  def slices
    self.each_slice(2).map {|x| x}
  end

  def exception_slice(id)
    object.where.not(id: id).each_slice(2).map {|x| x}
  end
end
