class OrdersController < ApplicationController
	before_action :set_order, only: [:edit, :update, :show, :destroy]

	def index
		@orders = Order.all
	end

	def new
		@order = Order.new
	end

	def edit
		
	end

	def create
		# render plain: params[:order].inspect
		@order = Order.new(order_params)
		if @order.save
			flash[:success] = "Comanda a fost creată cu succes"
			redirect_to order_path(@order)
		else
			render 'new'
		end
	end

	def update
		if @order.update(order_params)
			flash[:success] = "Comanda a fost actualizată cu succes"
			redirect_to order_path(@order)
		else
			render 'edit'
		end
			
	end

	def show

	end

	def destroy
		@order.destroy
		flash[:danger] = 'Comanda a fost ștearsă cu succes'
		redirect_to orders_path
	end

	private
	def set_order
		@order = Order.find(params[:id])
	end

	def order_params
		params.require(:order).permit(:greeting, :special_request, :delivery_date)
	end
end
