class ProspectsController < ApplicationController
  before_action :set_prospect, only: %i[ show edit update destroy ]

  def index
    @interested = Prospect.where(status: 'interesado').count
    @customers = Prospect.where(status: 'cliente').count
    @prospects2 = Prospect.where(status: 'prospecto').count
    @user = Prospect.where(user_id: current_user)
    @prospects = Prospect.all
  end

  def new
    @prospect = Prospect.new
    @status = ['interesado','prospecto','cliente']
  end

  def show
  end

  def edit
    @status = ['interesado','prospecto','cliente']
  end

  def create
      @prospect = Prospect.new(prospect_params)
      @prospect.user = current_user

      if @prospect.save
        redirect_to @prospect
      else
        render :new
      end
  end

  def update
    if @prospect.update(prospect_params)
      redirect_to @prospect
    else
      render :edit
    end
  end

  # DELETE /restaurants/1 or /restaurants/1.json
  def destroy
    @prospect.destroy
    redirect_to prospects_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prospect
      @prospect = Prospect.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def prospect_params
      params.require(:prospect).permit(:email,:name,:telephone,:status)
    end
 end
