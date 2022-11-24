class LinksController < ApplicationController

  def index
    @links = Link.all
    @url = request.base_url
  end

  def new
    @link = Link.new
    @random = sprintf '04%d', rand(-9999), unique: true
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      @link.short
      redirect_to links_path

    end
  end

  def show

  end

  def slug
    @link = Link.find_by(slug: params[:slug])
    @link.update_attribute(:clicked, @link.clicked + 1)
    redirect_to "#{@link.url}", allow_other_host: true
  end

  private

  def link_params
    params.require(:link).permit(:url, :slug, :shorten)
  end
end
