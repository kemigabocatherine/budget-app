class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @group = Group.find(params[:group_id])
    @purchases = @group.purchases.all
    @total = 0
    @purchases.each do |purchase|
      @total += purchase.amount
    end
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @group = Group.find(params[:group_id])
    @purchase = @group.purchases.new(purchase_params)
    @purchase.user_id = current_user.id

    if @purchase.save
      flash[:notice] = 'Transaction was successfully created'
      redirect_to group_purchases_path(@group)
    else
      render :new
    end
  end

  def recent_purchases
    @purchases = @group.purchases.all
    @purchases.order(created_at: :desc)
  end

  def purchase_params
    params.require(:purchase).permit(:name, :amount, :user_id, :group)
  end
end
