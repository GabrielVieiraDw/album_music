# frozen_string_literal: true

class Artist < ApplicationRecord
  has_many :albums

  def self.create_update_artists
    artists = Artist.get_external_artists

    artists.each do |artist|
      Artist.find_or_create_by(
        external_id: artist[:id],
        name: artist[:name],
        twitter: artist[:twitter]
      )
    end
  end

  def self.get_external_artists
    url = 'https://www.moat.ai/api/task/'
    headers = { Basic: 'ZGV2ZWxvcGVyOlpHVjJaV3h2Y0dWeQ==' }

    response = RestClient::Request.execute(
      method: :get,
      url: url,
      headers: headers
    )
    body = JSON.parse(response.body).flatten
    body = body.is_a?(Array) ? body.map { |hash| hash.transform_keys(&:to_sym) } : body.deep_symbolize_keys
  end
end
