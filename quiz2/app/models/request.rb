class Request < ApplicationRecord

  validates :name, presence: true
  validates :email, presence: true

  before_validation :set_status_default

  def self.search(keyword)
    where(["name ILIKE ? OR email ILIKE ? OR department ILIKE ? OR message ILIKE ?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
  end

  private

  def set_status_default
    self.status = false
  end
end
