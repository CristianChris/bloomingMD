class OrdersController < ApplicationController
	def new
		@order = Order.new
	end

	def create
		render plain: params[:order].inspect
		@order = Order.new(order_params)
		@order.save
		redirect_to orders_show(@order)
	end

	private
	def order_params
		params.require(:order).permit(:greeting, :special_request, :delivery_date)
	end
end