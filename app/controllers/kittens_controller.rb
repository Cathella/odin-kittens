class KittensController < ApplicationController
  before_action :set_kitten, only: %i[show edit update destroy]
  
  def index
    @kittens = Kitten.all
  end
  
  def show
  end

  def new
    @kitten = Kitten.new
  end
  
  def edit
  end
  
  def create
    @kitten = Kitten.new(kitten_params)

    respond_to do |format|
      if @kitten.save
        format.html { redirect_to @kitten, notice: "Kitten was added!" }
        format.json { render :show, status: :created, location: @kitten }
        format.xml { render :show, status: :created, location: @kitten }
      else
        format.html{ render :new, status: unprocessable_entity, notice: "Please try again!" }
        format.json { render json: @kitten.errors, status: :unprocessable_entity }
        format.xml { render xml: @kitten.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @kitten.update(kitten_params)
        format.html { redirect_to @kitten, notice: "Kitten updated!" }
        format.json { render :show, status: :ok, location: @kitten }
        format.xml { render :show, status: :ok, location: @kitten }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kitten.errors, status: :unprocessable_entity }
        format.xml { render json: @kitten.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @kitten.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Kitten removed" }
      format.json { head :no_content }
      format.xml { head :no_content }
    end
  end

  private

  def set_kitten
    @kitten = Kitten.find(params[:id])
  end

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
  
end