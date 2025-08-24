class DogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_dog, only: [ :edit, :update, :destroy ]

  def new
    @dog = current_user.dogs.new
  end

  def create
    @dog = current_user.dogs.new(dog_params)
    if @dog.save
      redirect_to mypage_path, notice: "わんこを登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @dog = current_user.dogs.find(params[:id])
  end

  def update
    if @dog.update(dog_params)
      redirect_to mypage_path, notice: "わんこを更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @dog.destroy
    redirect_to mypage_path, notice: "わんこの情報を削除しました"
  end

  private

  def set_dog
    @dog = current_user.dogs.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(
      :dog_name, :breed_id, :disease, :birthday,
      :family_hospital_name, :family_hospital_tel, :family_hospital_address,
      :emergency_hospital_name, :emergency_hospital_tel, :emergency_hospital_address,
      :taxi_tel, :insurance_image)
  end
end
