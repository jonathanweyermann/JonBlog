class Admin::PostChunksController < Admin::ApplicationController
  expose :post, find_by: :slug
  expose :post_chunk, parent: :post

  def create
    if post_chunk.save
      flash[:notice] = 'Post piece Created'
      redirect_to admin_post_path(post.slug)
    else
      render admin_post_path(post.slug)
    end
  end

  def update
    if post_chunk.update(post_chunk_params)
      flash[:notice] = 'Post piece Updated'
      redirect_to admin_post_path(post.slug)
    else
      render 'edit'
    end
  end

  def destroy
    post_chunk.destroy
    redirect_to admin_post_path(post.slug)
  end

  def post_chunk_params
    params.require(:post_chunk).permit(:name, :description, :image)
  end
end
