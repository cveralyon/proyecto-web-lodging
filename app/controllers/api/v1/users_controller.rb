class API::V1::UsersController < APIController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /api/v1/users
  def index
    @users = User.includes(:lodgings).all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      render :show, status: :created, location: api_v1_users_path(@user)
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    if @user.update(user_params)
      render :show, status: :ok, location: api_v1_users_path(@user)
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    redirect_to api_v1_users_path
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def user_params
    params.fetch(:user, {}).
      permit(:id, :email, :first_name, :last_name, :rut, :password,
             { lodgings_attributes: [:id, :name,:availability_from,
                                     :availability_to, :description, :daily_fee, :location,
                                     :pets_accepted, :parking_lot, :breakfast_included,
                                     :single_bed, :double_bed, :rooms, :bathrooms, :jacuzzi,
                                     :gym, :smoke_free],
               reservations_attributes: [:id, :entry_date, :departure_date, :price, :transfer_receipt,
                                         :reserve_expiration, :lodging_id],
               review_users_received_attributes: [:id, :text, :rating, :is_a_guest, :made_id],
               review_users_made_attributes: [:id, :text, :rating, :is_a_guest, :received_id],
               inbox_as_messageSender_attributes: [:id, :text, :messageReceiver_id],
               inbox_as_messageReceiver_attributes: [:id, :text, :messageSender_id],
               sended_reports_attributes: [:id, :subject, :text, :file, :reportReceiver_id],
               received_reports_attributes: [:id, :subject, :text, :file, :reportSender_id]
             })
  end
end
