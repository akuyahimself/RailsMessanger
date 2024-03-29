# frozen_string_literal: true

class Room < ApplicationRecord
  include Turbo::Broadcastable

  belongs_to :user

  has_many :messages, -> { sorted }, dependent: :destroy

  before_create { self.title = SecureRandom.hex(3) }
end
