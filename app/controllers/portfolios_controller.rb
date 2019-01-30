class PortfoliosController < ApplicationController
  caches_page :index
  expose(:portfolios) { Portfolio.all }
  expose(:portfolios_presenter) { PortfoliosDecorator.decorate_collection(portfolios.sorted_public) }
  expose(:posts) { Post.public(params[:page]).limit(4) }
  expose :portfolio
end
