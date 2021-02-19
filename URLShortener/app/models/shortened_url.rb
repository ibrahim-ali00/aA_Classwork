class Shortened_Url < ApplicationRecord
  validates :short_url, uniqueness: true
  validates :long_url, :user_id, :short_url, presence: true
end