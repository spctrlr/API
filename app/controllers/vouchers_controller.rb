class VouchersController < ApplicationController
  before_action :authorize
  before_action :set_voucher, only: %i[ show update destroy ]

  # GET /vouchers/1
  def show
    render json: @voucher
  end

  # POST /vouchers
  def create
    @voucher = Voucher.new(voucher_params.merge(user: @user))

    if @voucher.save
      render json: @voucher, status: :created, location: @voucher
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
  def set_voucher
    @voucher = Voucher.find(params[:id])
  end

   # Only allow a list of trusted parameters through.
  def voucher_params
    params.require(:voucher).permit(:balance, :currency, :secret_code, :expires_on)
  end
end
