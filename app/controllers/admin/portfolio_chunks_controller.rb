class Admin::PortfolioChunksController < Admin::ApplicationController
  before_filter :verify_logged_in

  expose :portfolio, find_by: :slug
  expose :portfolio_chunk, parent: :portfolio
  expose(:portfolios_presenter) { PortfoliosDecorator.decorate_collection(portfolios.priority) }

  def index
  end

  def create
    if portfolio_chunk.save
      flash[:notice] = 'Portfolio piece Created'
      redirect_to admin_portfolio_path(portfolio.slug)
    else
      render admin_portfolio_path(portfolio.slug)
    end
  end

  def update
    if portfolio_chunk.update(portfolio_chunk_params)
      flash[:notice] = 'Portfolio piece Updated'
      redirect_to admin_portfolio_path(portfolio.slug)
    else
      render 'edit'
    end
  end

  def destroy
    portfolio_chunk.destroy
    redirect_to admin_portfolio_path(portfolio.slug)
  end

  def portfolio_chunk_params
    params.require(:portfolio_chunk).permit(:name, :description, :image)
  end
end
