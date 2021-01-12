class Snippet < ApplicationRecord
  self.primary_key = :name

  scope :not_expired, -> { where("expires_at > ?", Time.zone.now) }

  def initialize(params)
    super
    self.expires_at ||= Time.zone.now + self.expires_in.seconds
  end

  def bump_expiration
    self.expires_at = self.expires_at + 30.seconds
    self
  end
end
