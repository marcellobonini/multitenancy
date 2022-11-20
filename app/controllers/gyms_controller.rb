class GymsController < ApplicationController
  before_action :set_gym, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /gyms or /gyms.json
  def index
    if(current_user.gym != nil)
      redirect_to gym_path(current_user.gym)
    else
      redirect_to new_gym_path
    end
  end

  # GET /gyms/1 or /gyms/1.json
  def show
  end

  # GET /gyms/new
  def new
    if(current_user.has_gym_assigned?)
      redirect_to gyms_path
    else
    @gym = Gym.new
    end
  end

  # GET /gyms/1/edit
  def edit
  end

  # POST /gyms or /gyms.json
  def create
    @gym = Gym.new(gym_params)
    respond_to do |format|
      if @gym.save
        current_user.gym_id = @gym.id
        current_user.save
        format.html { redirect_to gym_url(@gym), notice: "Gym was successfully created." }
        format.json { render :show, status: :created, location: @gym }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gym.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gyms/1 or /gyms/1.json
  def update
    respond_to do |format|
      if @gym.update(gym_params)
        format.html { redirect_to gym_url(@gym), notice: "Gym was successfully updated." }
        format.json { render :show, status: :ok, location: @gym }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gym.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gyms/1 or /gyms/1.json
  def destroy
    @gym.destroy
    current_user.gym = nil
    respond_to do |format|
      format.html { redirect_to gyms_url, notice: "Gym was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gym
      @gym = Gym.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gym_params
      params.require(:gym).permit(:name)
    end
    
end
