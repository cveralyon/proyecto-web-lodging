class API::V1::LodgingsController < APIController
  before_action :set_user, only: [:index, :create, :show, :update, :destroy]
  before_action :set_lodging, only:[:show, :update, :destroy]


  # GET /api/v1/users/1/lodgings
  def index
    @lodgings = Lodging.where(user: @user)
  end

  # GET /api/v1/users/1/lodgings
  def show
  end

  # GET /lodgings/new
  def new
    @lodging = Lodging.new
  end

  # GET /lodgings/1/edit
  def edit
  end

  # POST /lodgings or /lodgings.json
  def create
    @lodging = Lodging.new(lodging_params)
    @lodging.user = @user
    if @lodging.update(lodging_params)
      render :show, status: :ok, location: api_v1_user_lodgings_path(@lodging)
    else
      render json: @lodging.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lodgings/1 or /lodgings/1.json
  def update
    @lodging.user = @user
    if @lodging.update(lodging_params)
      render :show, status: :ok, location: api_v1_user_lodgings_path(@lodging)
    else
      render json: @lodging.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lodgings/1 or /lodgings/1.json
  def destroy
    @user = @lodging.user
    @lodging.destroy
    redirect_to api_v1_user_lodgings_path(@user)

  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_lodging
    @lodging = Lodging.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

    # Only allow a list of trusted parameters through.
  # Only allow a list of trusted parameters through.
  def lodging_params
    params.fetch(:lodging, {}).
      permit(:id, :name, :availability_from,
             :availability_to,:description, :daily_fee, :location,
             :pets_accepted, :parking_lot, :breakfast_included,
             :single_bed, :double_bed, :rooms, :bathrooms, :jacuzzi,
             :gym, :smoke_free, :user_id,
             { review_lodgings_attributes: [:id, :text, :rating],
               reservations_attributes: [:id, :entry_date, :deparure_date,
                                         :price, :transfer_receipt,
                                         :reserve_expiration]
             })
  end

end
