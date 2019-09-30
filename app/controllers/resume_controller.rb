class ResumeController < ApplicationController
  caches_page :index, :show
  layout "plain", only: 'show'
end
