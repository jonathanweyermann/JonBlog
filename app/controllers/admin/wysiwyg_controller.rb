class Admin::WysiwygController < Admin::ApplicationController
  def new
  end

  def create
    respond_to do |format|
      if img = Wysiwyg.create( image: params["file_name"].tempfile )
        format.json { render json: { link: img.image.file.file.split("public").last}}
      end
    end
  end

  def destroy
    w = Wysiwyg.find(params[:id])
    w.remove_image!
    w.destroy
  end

  private

  def wysiwyg_params
    params.require(:wysiwyg).permit(:post_id, :name, :image)
  end
end
