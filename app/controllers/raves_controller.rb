class RavesController < ApplicationController
  before_action :set_rave, only: [:show, :edit, :update, :destroy]

  def index
    @raves = Rave.all
  end

 
  def show
    @user = User.find_by(id: params[:user_id])
  end

  def new
    @rave = Rave.new
    @user = User.find_by(id: params[:user_id])
  end

  def create
    # if params[:user_id]
    @rave = Rave.new(rave_params(:name, :price, :date, :user_id))
    @user = User.find_by(id: params[:user_id])
    # user = User.find_by(session[:user_id].to_s)
    # parmas[:user_id] = @rave.user_id
    if @rave.save
    
      redirect_to user_rafe_path(@user, @rave)
    else
      flash[:message] = "Account was not created"
      render 'new'
    end
    # end
  end
  
  def edit
    @user = User.find_by(id: params[:user_id])
    @rave.user_id = params[:id]
  end

  def update
    respond_to do |format|
      if @planet.update(rave_params(:name, :price, :date, :user_id))
    @user = User.find_by(id: params[:user_id])
    redirect_to user_rafe_path(@user, @rave)
      end
    end
  end
# @rave.update(name: params[:rave][:name], price: params[:rave][:price], date: params[:rave][:date])
# raise.params.inspect

  # DELETE /raves/1
  # DELETE /raves/1.json
  def destroy
    @rave.destroy
    @user = User.find_by(id: params[:user_id])
    redirect_to user_path(@user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rave
      @rave = Rave.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rave_params(*args)
      params.require(:rave).permit(*args)
    end
end
