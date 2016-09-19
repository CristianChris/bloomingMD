class OrdersController < ApplicationController
	
	def index
		@orders = Order.all
	end

	def new
		@order = Order.new
	end

	def edit
		@order = Order.find(params[:id])
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

	def update
		@order = Order.find(params[:id])
		if @order.update(order_params)
			flash[:notice] = "Comanda a fost actualizată cu succes"
			redirect_to order_path(@order)
		else
			render 'edit'
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