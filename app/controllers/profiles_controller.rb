class ProfilesController < ApplicationController
  def show
    if current_user.id != Profile.where(user_id: params[:id]).first.user_id
      redirect_to '/'
    else
      @posts = Post.where(user_id: current_user.id).sort_by(&:date).reverse
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update_attributes(profile_params)
      @profile.save
      redirect_to '/'
    else
      render :edit
    end
  end

  def new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id

    respond_to do |format|
      if @profile.save
        format.html { redirect_to '/', notice: "Welcome" }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private
  def profile_params
    params.require(:profile).permit(:name, :avatar)
  end
end
