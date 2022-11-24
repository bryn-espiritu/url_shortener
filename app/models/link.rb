class Link < ApplicationRecord
  validates_presence_of :code, :long_url
  validates_uniqueness_of :code
  validate :long_url_format

  def long_url_format
    uri = URI.parse(long_url || "")
    if uri.host.nil?
      errors.add(:long_url, 'Invalid URL format')
    end
    # rescue URI::InvalidURIError => e
  end

  def recent_shortened_url
    "http://localhost:3000/#{Link.last.code}"
  end

  def shortened_url
    "http://localhost:3000/#{code}"
  end

  def custom_url
    random = sprintf "%04d", rand( - 9999)
    "http://CustomUrl.com/#{random}"
  end

end
