class UsersController < ApplicationController
  def index
    users = User.all
    render json: users.as_json
  end

  def create
    user = User.new(
      name: params[:name],
      width: params[:width],
      height: params[:height],
    )
    if user.save
      render json: user.as_json
    else
      render json: { errors: user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def show
    user = User.find_by(id: params[:id])
    render json: user.as_json
  end

  def update
    user = User.find_by(id: params[:id])
    user.name = params[:name] || user.name
    user.width = params[:width] || user.width
    user.height = params[:height] || user.height

    if user.save
      render json: user.as_json
    else
      render json: { errors: user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy
    render json: { message: "user successfully destroyed." }
  end
end
