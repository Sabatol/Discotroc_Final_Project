class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :is_completed?, except: [:show, :index]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(title: params[:title], content: params[:content], user_id: params[:user])
    if @article.save
      redirect_to article_path(@article.id)
      flash[:notice_good] = "Votre article a bien été publié"
    else
      flash[:notice_bad] = "Votre article n'a pas pu être publié"
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    post_params = params.require(:article).permit(:title, :content, :user)
    @article.update(post_params)
    redirect_to articles_path
  end

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
end
