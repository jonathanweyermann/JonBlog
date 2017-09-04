class Admin::PostsController < Admin::ApplicationController
  before_filter :verify_logged_in

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
    if params[:search]
      @posts = Post.search(params[:search]).all.order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
    else
      @posts = Post.all.order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
    end
  end

  def show
  end

  private
  def post_params
    params.require(:post).permit(:title, :category_id, :user_id, :tags, :image, :body)
  end
end
