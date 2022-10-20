class VouchersController < ApplicationController

  before_action :set_user
  before_action :set_voucher, only: %i[ show update destroy ]

  def index
    @vouchers = @user.vouchers.all
    render json: @vouchers
  end

  # GET /vouchers/1
  def show
    @voucher = @user.vouchers.find(params[:id])
    render json: @voucher
  end

  # POST /vouchers
  def create
    @voucher = @user.vouchers.new(voucher_params)

    if @voucher.save
      render json: @voucher, status: :created
    else
      render json: @voucher.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vouchers/1
  def update
    if @voucher.update(voucher_params)
      render json: @voucher
    else
      render json: @voucher.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vouchers/1
  def destroy
    @voucher.destroy
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:user_id])
  end

  def set_voucher
    @voucher = Voucher.find(params[:id])
  end

   # Only allow a list of trusted parameters through.
  def voucher_params
    params.require(:voucher).permit(:balance, :currency, :secret_code)
  end
end
