# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  short_url  :string           not null
#  long_url   :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'securerandom'

class ShortenedUrl < ApplicationRecord

    def self.random_code(str)

        SecureRandom.urlsafe_base64(str)
    end

    def initialize
        short_url = ShortenedUrl.random_code(long_url)
    end
    
    validates :short_url, presence: true
    validates :long_url, presence: true
    validates :user_id, presence: true

    # include SecureRandom

    
end
