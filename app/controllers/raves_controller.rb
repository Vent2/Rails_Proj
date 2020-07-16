class RavesController < ApplicationController
  before_action :set_rave, only: [:show, :edit, :update]

  def index
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      @raves = @user.raves
    else
      @raves = Rave.all
    end
  end

 
  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
    end
    @rave = Rave.new
  end

  def create
    @rave = Rave.new(rave_params(:name, :price, :date, :user_id))
    @user = User.find_by(id: params[:id])
    
    if @rave.save
    
      redirect_to @rave
    else
      flash[:message] = "Account was not created"
      render 'new'
    end
  end
  
  def edit
    @user = User.find_by(id: params[:user_id])
    @rave.user_id = params[:id]
  end

  def update
    # respond_to do |format|
      if @rave.update(rave_params(:name, :price, :date, :user_id))
    # @user = User.find_by(id: params[:user_id])
    redirect_to @rave
      end
  end

  def destroy
    @rave = Rave.find_by(id: params[:id])
    @rave.delete
    @user = User.find_by(id: params[:id])
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
