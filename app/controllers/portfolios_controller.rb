class PortfoliosController < ApplicationController
  caches_page :index
  expose(:portfolios) { Portfolio.all }
  expose(:portfolios_presenter) { PortfoliosDecorator.decorate(portfolios.sorted_public) }
  expose :portfolio
end
