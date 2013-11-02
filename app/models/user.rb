class User < ActiveRecord::Base
  has_many :user_places
  attr_readonly :uuid
  before_validation :gen_uuid, on: :create
  validates :uuid, presence: true, uniqueness: true
  private
  def gen_uuid
    self.uuid = RandomToken.gen(32)
  end
end