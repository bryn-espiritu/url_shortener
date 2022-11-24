class Link < ApplicationRecord
  validates :url, format: URI::regexp(%w[http https])
  validates_uniqueness_of :slug
  validates_length_of :url, within: 3..255, on: :create, message: "too long"
  validates_length_of :slug, within: 3..255, on: :create, message: "too long"

  def short
    SecureRandom.uuid[0..4]
  end

  def generate_short_string
    loop do
      @string_unique = sprintf "%04d", rand(-9999)
      break unless Post.exists?(slug: slug)
    end
    self.slug = @string_unique
  end

end

