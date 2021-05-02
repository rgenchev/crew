class AboutController < ApplicationController
  def index
    add_breadcrumb "About", about_url
  end
end
