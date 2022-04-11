class ReviewLodgingsController < ApplicationController

  before_action :set_review_lodging, only: %i[ show edit update destroy ]

  # GET /review_lodgings or /review_lodgings.json
  def index
    if params.has_key?(:user_id)
      @user = User.find(params[:user_id])
      @lodgings = Lodging.where(user_id: @user.id)
      @lodgings.each do |log|
        @review_lodgings = ReviewLodging.where(lodging_id: log.id )
      end
      @review_lodgings
    else
      @review_lodgings = ReviewLodging.all
    end
  end

  # GET /review_lodgings/1 or /review_lodgings/1.json
  def show
  end

  # GET /review_lodgings/new
  def new
    @review_lodging = ReviewLodging.new
  end

  # GET /review_lodgings/1/edit
  def edit
  end

  # POST /review_lodgings or /review_lodgings.json
  def create
    @review_lodging = ReviewLodging.new(review_lodging_params)

    respond_to do |format|
      if @review_lodging.save
        format.html { redirect_to @review_lodging, notice: "Review lodging was successfully created." }
        format.json { render :show, status: :created, location: @review_lodging }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review_lodging.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /review_lodgings/1 or /review_lodgings/1.json
  def update
    respond_to do |format|
      if @review_lodging.update(review_lodging_params)
        format.html { redirect_to @review_lodging, notice: "Review lodging was successfully updated." }
        format.json { render :show, status: :ok, location: @review_lodging }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review_lodging.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /review_lodgings/1 or /review_lodgings/1.json
  def destroy
    @review_lodging.destroy
    respond_to do |format|
      format.html { redirect_to review_lodgings_url, notice: "Review lodging was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review_lodging
      @review_lodging = ReviewLodging.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_lodging_params
      params.require(:review_lodging).permit(:text, :rating)
    end
end
