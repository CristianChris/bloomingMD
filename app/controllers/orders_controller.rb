class OrdersController < ApplicationController
	def new
		@order = Order.new
	end

	def create
		# render plain: params[:order].inspect
		@order = Order.new(order_params)
		if @order.save
			flash[:notice] = "Comanda a fost creată cu succes"
			redirect_to order_path(@order)
		else
			render 'new'
		end
	end

	def show
		@order = Order.find(params[:id])
	end

	private
	def order_params
		params.require(:order).permit(:greeting, :special_request, :delivery_date)
	end
end