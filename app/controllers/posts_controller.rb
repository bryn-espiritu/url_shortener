class PostsController < ApplicationController
  def new
    @link = Link.new
    @links = Link.all
  end

end
