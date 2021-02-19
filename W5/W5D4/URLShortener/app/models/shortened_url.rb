class Shortened_Url < ApplicationRecord
  validates :short_url, uniqueness: true
  validates :long_url, :user_id, :short_url, presence: true


  belongs_to :submitter,
  class_name: :User,
  foreign_key: :user_id

  def self.random_code
    loop do
      random_code = SecureRandom.urlsafe_base64(16)
      return random_code unless Shortened_Url.exists?(short_url: random_code)
    end
    
    def self.create_shorturl(user, long_url)
      Shortened_Url.create!(user_id: user.id, long_url: long_url, short_url: Shortened_Url.random_code)
    end
  end
end