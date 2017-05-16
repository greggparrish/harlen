class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  belongs_to :order_status
  before_save :update_subtotal
  after_initialize :set_open_status, if: :new_record?

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  private
  def set_open_status
    self.order_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end

end
