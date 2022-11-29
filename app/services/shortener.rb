class Shortener
  attr_reader :url, :link_model

  def initialize(url, link_model = Link)
    @url = url
    @link_model = link_model
  end

  def generate_short_link
      link_model.create(long_url: url, code: code)
      # Rails.application.routes.url_helpers.url(alias: self.alias)
    end

  def code
    loop do
      code = get_fresh_code
      break code unless link_model.exists?(code: code)
    end
  end

  private

  def get_fresh_code
    SecureRandom.uuid[0..6]
  end
end