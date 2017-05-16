class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @orders = policy_scope(Order)
  end

  def show
  end

  private
  def set_user
    @user = current_user
    authorize @user
  end

  def set_order
    @order = current_user.orders.where(order_status_id: 1)
    authorize @order
  end

end
