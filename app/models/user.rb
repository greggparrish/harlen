class User < ApplicationRecord
  enum role: [:client, :editor, :admin]
  has_many :orders
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :client
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
