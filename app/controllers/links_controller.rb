class LinksController < ApplicationController

  def show
    link = Link.find_by(code: params[:code])
    redirect_to link.long_url, allow_other_host: true
  end

  def create
    shortener = Shortener.new(link_params[:long_url])
    @link = shortener.generate_short_link
    if @link.save
      redirect_back(fallback_location: root_path)
    else
      not_found
    end
  end

  private

  def link_params
    params.require(:link).permit(:long_url)
  end
end
