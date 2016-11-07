class Admin::WysiwygController < Admin::ApplicationController
  def new
  end

  def create
    respond_to do |format|
      binding.pry
      if img = Wysiwyg.create( image: params["file_name"].tempfile )
        binding.pry
        format.json { render json: { link: img.image.file.file.split("public").last}}
      end
    end
  end

  def destroy
    binding.pry
    w = Wysiwyg.find(params[:id])
    w.remove_avatar!
    w.save
  end

  private

  def wysiwyg_params
    params.require(:wysiwyg).permit(:post_id, :name, :image)
  end
end
