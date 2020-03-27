class DucksController < ApplicationController
  before_action :get_duck, except: [:index, :create]

  def index
    @ducks = Duck.all
  end

  def show
  end

  def new
  end

  def create
    @duck = Duck.create(duck_params)
    if @duck.valid? then
      redirect_to duck_path(@duck)
    else
      # show the errors
      redirect_to new_duck_path(@duck)
    end
  end

  def edit
  end

  def update
    @duck.update(duck_params)
    if @duck.valid? then
      redirect_to duck_path(@duck)
    else
      #show the errors
      redirect_to edit_duck_path(@duck)
    end
  end

  private

  def duck_params
    params.require(:duck).permit(:name, :description, :student_id)
  end

  def get_duck
    @duck = Duck.find_by(id: params[:id]) || Duck.new
  end

end
