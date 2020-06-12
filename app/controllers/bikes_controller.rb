class BikesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @bikes = Bike.all
  end

  def show
    @bike = Bike.find(params[:id])
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user_id = current_user.id
    if @bike.save
      redirect_to bike_path(@bike), notice: "投稿しました。"
    else
      render :new
    end
  end

  def edit
    @bike = Bike.find(params[:id])
    if @bike.user_id != current_user.id
      redirect_to bikes_path, alert: "アクセス権限がありません。"
    end
  end

  def update
    @bike = Bike.find(params[:id])
    if @bike.update(bike_params)
      redirect_to bike_path(@bike), notice: "更新しました。"
    else
      render :edit
    end
  end

  def destroy
    bike = Bike.find(params[:id])
    bike.destroy
    redirect_to bikes_path
  end

  private

  def bike_params
    params.require(:bike).permit(:title, :body, :image)
  end

end
