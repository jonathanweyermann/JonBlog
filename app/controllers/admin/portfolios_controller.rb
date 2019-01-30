class Admin::PortfoliosController < Admin::ApplicationController
  before_filter :verify_logged_in

  expose :portfolio, find_by: :slug
  expose(:portfolio_presenter) { PortfoliosDecorator.decorate(portfolio)}
  expose(:portfolios) { Portfolio.all }
  expose(:portfolios_presenter) { PortfoliosDecorator.decorate_collection(portfolios.priority) }

  def edit
    if (params[:toggle])
      portfolio.is_published? ? portfolio.not_published! : portfolio.is_published!
      redirect_to admin_portfolios_path and return
    end
  end

  def create
    if portfolio.save
      flash[:notice] = 'Portfolio piece Created'
      redirect_to admin_portfolios_path
    else
      render 'new'
    end
  end

  def update
    if portfolio.update(portfolio_params)
      flash[:notice] = 'Portfolio piece Updated'
      redirect_to admin_portfolios_path
    else
      render 'edit'
    end
  end


  def portfolio_params
    params.require(:portfolio).permit(:name, :description, :image, :link, :priority, :published)

  end
end
