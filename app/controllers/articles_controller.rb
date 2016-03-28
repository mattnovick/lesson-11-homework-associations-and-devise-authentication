class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
    logger.info "Article: #{@article}"
    logger.info "Article is nil? #{@article.nil?}"
  end

  def edit          
    @article = Article.find(params[:id]) 
  end

  def create
    puts "Creating article..."
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was successfully created"       
      redirect_to articles_path
    else       
      render :new
    end
  end

  def update      
    @article = Article.find(params[:id])    
    if @article.update(article_params)  
      redirect_to article_path(@article), notice: "Article was successfully updated" 
    else 
      render :edit 
    end
  end

  def destroy          
    @article = Article.find(params[:id])
    @article.destroy   
    redirect_to articles_path   
  end

  private
  
  def article_params     
  # using strong params to only permit the attributes (fields) that we explicitly allow     
  params.require(:article).permit(:title, :body, author_ids: [], tag_ids: [])   
  end
end