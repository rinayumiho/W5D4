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
    validates :short_url, presence: true
    validates :long_url, presence: true
    validates :user_id, presence: true

    def self.random_code
        return random_code = SecureRandom.urlsafe_base64 #unless ShortenedUrl.exists?(random_code)
    end

    belongs_to :submitter,
        primary_key: :id,
        foreign_key: :user_id
        class_name: :User
end
