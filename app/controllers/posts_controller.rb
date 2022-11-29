class PostsController < ApplicationController
  require 'csv'

  def new
    @link = Link.new
    @links = Link.all

      respond_to do |format|
        format.html
        format.csv {
          csv_string = CSV.generate do |csv|
            csv << [User.human_attribute_name(:email), Link.human_attribute_name(:id), Link.human_attribute_name(:code), Link.human_attribute_name(:long_url), Link.human_attribute_name(:click), Link.human_attribute_name(:created_at)]
            @links.each do |p|
              csv << [p.user.email, p.id, p.code, p.long_url, p.click, p.created_at]
            end
          end
          send_data csv_string, :filename => "links-#{Time.now.to_s(:number)}.csv"
        }
      end
    end

  def show #Click Show
    @link = Link.find(params[:id])
    @link.update_attribute(:click, @link.click + 1)
    redirect_to @link.long_url, allow_other_host: true
  end

  def destroy
    @link = Link.find_by(params[:id])
    @link.destroy
    redirect_to post_path
  end
end
