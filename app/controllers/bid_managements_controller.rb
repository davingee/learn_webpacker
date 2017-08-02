class BidManagementsController < ApplicationController
  before_action :set_bid_management, only: [:show, :edit, :update, :destroy]

  # GET /bid_managements
  # GET /bid_managements.json
  def index
    @bid_managements = BidManagement.all
  end

  # GET /bid_managements/1
  # GET /bid_managements/1.json
  def show
  end

  # GET /bid_managements/new
  def new
    @bid_management = BidManagement.new
  end

  # GET /bid_managements/1/edit
  def edit
  end

  # POST /bid_managements
  # POST /bid_managements.json
  def create
    @bid_management = BidManagement.new(bid_management_params)

    respond_to do |format|
      if @bid_management.save
        format.html { redirect_to @bid_management, notice: 'Bid management was successfully created.' }
        format.json { render :show, status: :created, location: @bid_management }
      else
        format.html { render :new }
        format.json { render json: @bid_management.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bid_managements/1
  # PATCH/PUT /bid_managements/1.json
  def update
    respond_to do |format|
      if @bid_management.update(bid_management_params)
        format.html { redirect_to @bid_management, notice: 'Bid management was successfully updated.' }
        format.json { render :show, status: :ok, location: @bid_management }
      else
        format.html { render :edit }
        format.json { render json: @bid_management.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bid_managements/1
  # DELETE /bid_managements/1.json
  def destroy
    @bid_management.destroy
    respond_to do |format|
      format.html { redirect_to bid_managements_url, notice: 'Bid management was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bid_management
      @bid_management = BidManagement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bid_management_params
      params.require(:bid_management).permit(:name)
    end
end
