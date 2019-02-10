class BillListsController < ApplicationController
  before_action :set_bill_list, only: [:show, :edit, :update, :destroy]
  # before_action :set_bill_id, :return_items, only: [:caluclate_bill]

  # GET /bill_lists
  # GET /bill_lists.json
  def index
    @bill_lists = BillList.all
  end

  # GET /bill_lists/1
  # GET /bill_lists/1.json
  def show
  end

  # GET /bill_lists/new
  def new
    @bill_list = BillList.new
  end

  # GET /bill_lists/1/edit
  def edit
  end

  # POST /bill_lists
  # POST /bill_lists.json
  def create
    @bill_list = BillList.new(bill_list_params)

    respond_to do |format|
      if @bill_list.save
        format.html { redirect_to @bill_list, notice: 'Bill list was successfully created.' }
        format.json { render :show, status: :created, location: @bill_list }
      else
        format.html { render :new }
        format.json { render json: @bill_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bill_lists/1
  # PATCH/PUT /bill_lists/1.json
  def update
    respond_to do |format|
      if @bill_list.update(bill_list_params)
        format.html { redirect_to @bill_list, notice: 'Bill list was successfully updated.' }
        format.json { render :show, status: :ok, location: @bill_list }
      else
        format.html { render :edit }
        format.json { render json: @bill_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bill_lists/1
  # DELETE /bill_lists/1.json
  def destroy
    @bill_list.destroy
    respond_to do |format|
      format.html { redirect_to bill_lists_url, notice: 'Bill list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def calculate_bill
    @bill_items_in_list = return_items()
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill_list
      @bill_list = BillList.find(params[:id])
    end

    def return_items
      @bill_item = BillItem.select("id, user, paid_amount").where("bill_list_id = ?", params[:id])
      @final_array = normalized_bill(@bill_item)
      
      @msg = []
      @array_baru = recursive_split_bill(@final_array, @msg)
    end

    def normalized_bill(bill_list)
      normalized_bill_in_group = bill_list

      total_bill_in_group = 0
      bill_list.each do |i|
        total_bill_in_group = total_bill_in_group + i.paid_amount 
      end

      bill_average = total_bill_in_group/bill_list.length

      bill_list.each do |j|
        j.paid_amount = bill_average - j.paid_amount
      end

      return normalized_bill_in_group.sort { |a,b| a.paid_amount <=> b.paid_amount }
    end

    def recursive_split_bill(normalizedBill, msg)
      arr = normalizedBill
      allEqual = arr.all? {|x| x.paid_amount < 1}

      if allEqual == false
        if arr[arr.length-1].paid_amount != 0
          msg << "#{arr[arr.length-1].user} harus membayar uang sebesar #{arr[arr.length-1].paid_amount} kepada #{arr[0].user}"
        end
        
        arr[0].paid_amount = arr[0].paid_amount + arr[arr.length-1].paid_amount
        arr[arr.length-1].paid_amount = 0
        arr = arr.sort { |a,b| a.paid_amount <=> b.paid_amount }
        recursive_split_bill(arr, msg)
      else
        puts "Semua sudah terbayar"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bill_list_params
      params.require(:bill_list).permit(:title, :description)
    end
end
