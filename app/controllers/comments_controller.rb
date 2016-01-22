class CommentsController < ApplicationController
   before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all.order("created_at DESC")
  end

  def new
    @comment = Comment.new
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comments_params)
    if@comment.save
      redirect_to @article, notice: "Comment saved successfully"
    else
      redirect_to @article, notice: "Comment failed to save"
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end
  end

  def comments_params
    params.require(:comments).permit(:body)
  end
end
