class AboutController < ApplicationController
  def index
    authorize :about, :index?

    add_breadcrumb "About", about_url
  end
end
