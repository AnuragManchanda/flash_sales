class DealsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_deal, only: [:show, :edit, :update, :destroy, :buy]

  # GET /deals
  # GET /deals.json
  def index
    if current_user.is_admin?
      @deals = Deal.all
    else
      @deal_of_the_day = Deal.where(is_live:true).limit(1)
      @bought_deals = current_user.user_deals
      bought_deal_ids = @bought_deals.pluck(:deal_id)
      if bought_deal_ids.include? @deal_of_the_day.first.id
        @already_bought = true
      else
        @already_bought = false
      end
    end
  end

  def buy
    discount = current_user.user_deals.count < 5 ? current_user.user_deals.count : 5
    if current_user.user_deals.create!(deal_id: @deal.id, discount: discount)
      respond_to do |format|
        format.html { redirect_to deals_url, notice: 'Deal was Bought.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to deals_url, notice: 'Some Error Occured' }
        format.json { head :no_content }
      end
    end
  end

  # GET /deals/1
  # GET /deals/1.json
  def show
  end

  # GET /deals/new
  def new
    @deal = Deal.new
  end

  # GET /deals/1/edit
  def edit
  end

  # POST /deals
  # POST /deals.json
  def create
    @deal = Deal.new(deal_params)

    respond_to do |format|
      if @deal.save
        format.html { redirect_to @deal, notice: 'Deal was successfully created.' }
        format.json { render :show, status: :created, location: @deal }
      else
        format.html { render :new }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deals/1
  # PATCH/PUT /deals/1.json
  def update
    respond_to do |format|
      if @deal.update(deal_params)
        format.html { redirect_to @deal, notice: 'Deal was successfully updated.' }
        format.json { render :show, status: :ok, location: @deal }
      else
        format.html { render :edit }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deals/1
  # DELETE /deals/1.json
  def destroy
    @deal.destroy
    respond_to do |format|
      format.html { redirect_to deals_url, notice: 'Deal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deal
      @deal = Deal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deal_params
      params.require(:deal).permit(:title, :is_live, :discription, :price, :discounted_price, :quantity, :publish_date, :image)
    end
end
