class DashboardController < ApplicationController
  caches_page :index
  expose(:portfolios) { Portfolio.all }
  expose(:portfolios_presenter) { PortfoliosDecorator.decorate(portfolios.sorted_public.first(6)) }
  expose(:posts) { Post.public(params[:page]).limit(4) }
  expose(:posts_presenter) { PostsDecorator.decorate(posts) }
  expose :portfolio
end
