class AuthorsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def show
    @author = Author.find(params[:id])
  end

  def edit          
    @author = Author.find(params[:id]) 
  end

  def create
    puts "Creating author..."
    @author = Author.new(author_params)
    if @author.save
      flash[:notice] = "Author was successfully created"       
      redirect_to authors_path
    else       
      render :new
    end
  end

  def update      
    @author = Author.find(params[:id])    
    if @author.update(author_params)  
      redirect_to author_path(@author), notice: "Author was successfully updated" 
    else 
      render :edit 
    end
  end

  def destroy          
    @author = Author.find(params[:id])
    @author.destroy   
    redirect_to authors_path   
  end

  private
  
  def author_params     
  # using strong params to only permit the attributes (fields) that we explicitly allow     
  params.require(:author).permit(:first_name, :last_name)   
  end
end