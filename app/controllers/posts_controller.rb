class PostsController < ApplicationController
  def new
    @link = Link.new
    @links = Link.all
  end

  def show #Click Show
    @link = Link.find(params[:id])
    @link.update_attribute(:click, @link.click + 1)
    redirect_to @link.long_url, allow_other_host: true
  end
end
