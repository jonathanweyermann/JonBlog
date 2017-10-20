class Admin::PostsController < Admin::ApplicationController
  before_filter :verify_logged_in
  layout 'application', only: [:show]
  expose(:posts) { all_your_posts }
  expose(:posts_presenter) { PostDecorator.decorate_collection(posts) }

  def new
    @page_title = 'Add Post'
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if params[:post][:image].blank?
      @post.image_file_name = nil
    end
    if @post.save
      flash[:notice] = 'Post Created'
      redirect_to admin_posts_path
    else
      render 'new'
    end
  end

  def show
    @categories = Category.all
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
    @comment = Comment.new
    @comments = Comment.all
  end

  def edit
    @post = Post.find(params[:id])
    if (params[:toggle])
      @post.production? ? @post.draft! : @post.production!
      redirect_to admin_posts_path and return
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = 'Post Updated'
      redirect_to admin_posts_path
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if params[:comments_only]=="true"
      @post.comments.each do |c|
        c.destroy
      end
      flash[:notice] = 'comments removed'
    else
      @post.destroy
      flash[:notice] = 'Post Removed'
    end
    redirect_to admin_posts_path
 end

  def index

  end

  private

  def all_your_posts
    if params[:search]
      Post.search(params[:search]).all.pub_sorted.paginate(:per_page => 10, :page => params[:page])
    else
      Post.all.pub_sorted.paginate(:per_page => 10, :page => params[:page])
    end
  end

  def post_params
    params.require(:post).permit(:title, :category_id, :user_id, :tags, :image, :body, :publish_date)
  end
end
