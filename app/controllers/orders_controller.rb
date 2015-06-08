class OrdersController < ApplicationController
	before_action :authenticate_user!, except: [:new, :create] 
	before_action :set_order, only: [:show, :edit, :update, :destroy]

	# GET /orders
	# GET /orders.json
	def index
		add_breadcrumb 'Главная', :root_path
		add_breadcrumb 'Заказы', :orders_path
		if current_user.manager? 
			@orders = Order.all
		else
			@orders = Order.find_by_client_id(current_user.id)
		end		
	end

	# GET /orders/1
	# GET /orders/1.json
	def show
		if @order.client == current_user
			add_breadcrumb 'Главная', :root_path
			add_breadcrumb 'Заказы', :orders_path
			add_breadcrumb "Заказ № #{@order.id} от #{@order.date_and_time_created}"
		else
			redirect_to orders_path, notice: "У вас нет такого заказа"
		end
	end

	# GET /orders/new
	def new
		add_breadcrumb 'Главная', :root_path
		add_breadcrumb 'Заказы', :orders_path
		add_breadcrumb 'Новый'

		@order = Order.new
		@profile = @order.build_profile
	end

	# GET /orders/1/edit
	def edit
		add_breadcrumb 'Главная', :root_path
		add_breadcrumb 'Заказы', :orders_path
		add_breadcrumb "Редактирую заказ № #{@order.id}"

		@profile = @order.profile	
	end

	# POST /orders
	# POST /orders.json
	def create
		@order = Order.new(order_params)
		# @order.client = current_user
		@order.status = OrderStatus.statuses[:new]

		respond_to do |format|
			if @order.save
				format.html { redirect_to @order, notice: 'Ваш заказ принят!' }
				format.json { render :show, status: :created, location: @order }
			else
				format.html { render :new }
				format.json { render json: @order.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /orders/1
	# PATCH/PUT /orders/1.json
	def update

		# TODO check whether user updating it's own order

		# if user updates it's order, than change order status to updated
		respond_to do |format|
			if @order.update(order_params)
				format.html { redirect_to @order, notice: 'Заказ обновлен.' }
				format.json { render :show, status: :ok, location: @order }
			else
				format.html { render :edit }
				format.json { render json: @order.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /orders/1
	# DELETE /orders/1.json
	def destroy
		if !current_user.manager?
			if @order.client == current_user
				@order.destroy
				respond_to do |format|
					format.html { redirect_to orders_url, notice: 'Заказ удален.' }
					format.json { head :no_content }
				end
			end
		else
			@order.destroy
			respond_to do |format|
				format.html { redirect_to orders_url, notice: 'Заказ удален.' }
				format.json { head :no_content }
			end
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_order
		begin
			@order = Order.find(params[:id])
		rescue 
			redirect_to orders_path
		end
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def order_params
		if current_user
			if current_user.manager? 
				params.require(:order).permit(:description, :comment, :status, profile_attributes: [:id, :first_name, :last_name, :phone, :email])
			end
		else
			params.require(:order).permit(:description, :comment, profile_attributes: [:id, :first_name, :last_name, :phone, :email])
		end
	end
end
