class PaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_payment, only: %i[show edit update destroy]

  def index
    @payments = current_user.payments
  end

  def show; end

  def new
    @payment = Payment.new
  end

  def edit; end

  def create
    @payment = Payment.new(payment_params)
    @payment.author = current_user

    respond_to do |format|
      if @payment.save
        format.html { redirect_to payment_url(@payment), notice: 'Payment was successfully created.' }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to payment_url(@payment), notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @payment.destroy

    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_payment
    @payment = current_user.payments.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def payment_params
    params.require(:payment).permit(:name, :amount, :author_id, group_ids: [])
  end
end
