class ResumeController < ApplicationController

  layout "plain", only: 'show'

  def index
  	@categories = Category.all
  end
end
