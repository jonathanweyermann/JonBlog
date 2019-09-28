class Admin::CategoriesController < Admin::ApplicationController
  expose(:categories ) { Category.paged_search(params[:page], params[:search]) }
  expose(:category)

  def create
    if category.save
      flash[:notice] = 'Category Created'
      redirect_to admin_categories_path
    else
      render 'new'
    end
  end

  def update
    if category.update(category_params)
      flash[:notice] = 'Category Updated'
      redirect_to admin_categories_path
    else
      render 'new'
    end
  end

  def destroy
    if category.destroy
      flash[:notice] = 'Category Removed'
      redirect_to admin_categories_path
    else
      flash[:alert] = 'Could not delete'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
