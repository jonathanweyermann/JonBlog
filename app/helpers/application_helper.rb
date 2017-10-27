module ApplicationHelper
  def comment_descriptor
    if params[:comment_id].present?
      "Replying to comment #{Comment.find(params[:comment_id]).try(:name)}/#{Comment.find(params[:comment_id]).try(:created_at)}"
    else
      "Add Comment"
    end
  end
end
