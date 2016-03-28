class TagsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def edit          
    @tag = Tag.find(params[:id]) 
  end

  def create
    puts "Creating tag..."
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:notice] = "Tag was successfully created"       
      redirect_to tags_path
    else       
      render :new
    end
  end

  def update      
    @tag = Tag.find(params[:id])    
    if @tag.update(tag_params)  
      redirect_to tag_path(@tag), notice: "Tag was successfully updated" 
    else 
      render :edit 
    end
  end

  def destroy          
    @tag = Tag.find(params[:id])
    @tag.destroy   
    redirect_to tags_path   
  end

  private
  
  def tag_params     
  # using strong params to only permit the attributes (fields) that we explicitly allow     
  params.require(:tag).permit(:name)   
  end
end