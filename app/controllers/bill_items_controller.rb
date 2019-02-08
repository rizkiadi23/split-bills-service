class BillItemsController < ApplicationController
  before_action :set_bill_list

  def create
    @bill_item = @bill_list.bill_items.create(bill_item_params)
    redirect_to @bill_list
  end

  def destroy
    @bill_item = @bill_list.bill_items.find(params[:id])
    if @bill_item.destroy
      flash[:success] = "Bill list item was deleted"
    else
      flash[:error] = "Bill list could not be deleted"
    end
    redirect_to @bill_list
  end

  private

  def set_bill_list
    @bill_list = BillList.find(params[:bill_list_id])
  end

  def bill_item_params
    params[:bill_item].permit(:user, :paid_amount)
  end
end
