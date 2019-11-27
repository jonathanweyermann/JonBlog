module ApplicationHelper
  def comment_descriptor
    if params[:comment_id].present?
      raw ("Replying to comment #{Comment.find(params[:comment_id]).try(:name)}<span class='comment_date'>#{Comment.find(params[:comment_id]).try(:created_at).to_time.strftime('%B %e %Y at %l:%M %p')}</span>")
    else
      "Add Comment"
    end
  end
end
