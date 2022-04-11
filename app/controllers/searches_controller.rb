class SearchesController < ApplicationController

  # GET /searches/new
  def new
    @search = Search.new
  end

  # POST /searches or /searches.json
  def create
    @search = Search.create(search_params)
    redirect_to @search, notice: "This are the results of your search."
  end

  # GET /searches/1 or /searches/1.json
  def show
    @search = Search.find(params[:id])
  end

  private

  # Only allow a list of trusted parameters through.
  def search_params
    params.require(:search).permit(:keywords, :check_in, :check_out, :daily_fee_min,
                                   :daily_fee_max, :location, :pets_accepted,
                                   :parking_lot, :breakfast_included, :single_bed,
                                   :double_bed, :rooms, :bathrooms, :jacuzzi, :gym,
                                   :smoke_free)
  end
end
