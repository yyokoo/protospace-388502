class PrototypesController < ApplicationController
  before_action :set_prototype, except: [:index, :new, :create]
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :move_to_index, except: [:index, :show, :new, :create]
  def index
    @prototypes = Prototype.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype)
    else
      render :edit
    end
  end
   
  def destroy
    if @prototype.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
    

    
  

private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def move_to_index
    if @prototype.user != current_user
      redirect_to action: :index
    end
  end

end
