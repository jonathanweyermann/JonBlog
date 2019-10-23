class Admin::PostsController < Admin::ApplicationController
  layout 'application', only: [:show]
  expose (:latest_posts) { Post.all.visible.pub_sorted.first(8) }
  expose(:posts) { Post.paged_search(params[:page], params[:search]) }
  expose :post, find_by: :slug
  expose(:user) { post.user }
  expose(:posts_presenter) { PostDecorator.decorate_collection(posts) }

  def create
    if post.save
      flash[:notice] = 'Post Created'
      redirect_to admin_posts_path
    else
      render 'new'
    end
  end

  def edit
    if (params[:toggle])
      post.production? ? post.draft! : post.production!
      redirect_to admin_posts_path and return
    end
  end

  def update
    if post.update(post_params)
      flash[:notice] = 'Post Updated'
      redirect_to admin_posts_path
    else
      render 'new'
    end
  end

  def destroy
    if params[:comments_only]=="true"
      post.comments.destroy_all
      flash[:notice] = 'comments removed'
    else
      post.destroy
      flash[:notice] = 'Post Removed'
    end
    redirect_to admin_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :category_id, :user_id, :tags, :image, :body, :publish_date, :job_priority)
  end
end
