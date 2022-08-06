class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @purchases = Purchase.all
  end

  def new
    @purchase = Purchase.new
  end

  def create
    # @group = Group.find(params[:id])
    @purchase = Purchase.new(purchase_params)
    @purchase.user_id = current_user.id

    if @purchase.save
      flash[:notice] = 'Transaction was successfully created'
      redirect_to groups_path
    else
      render :new
    end
  end

  def purchase_params
    params.require(:purchase).permit(:name, :amount, :user_id)
  end
end
