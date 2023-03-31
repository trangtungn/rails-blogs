# frozen_string_literal: true

# articles controller
class ArticlesController < ApplicationController
  before_action :prepare_account
  before_action :prepare_article, only: %i(show edit update destroy)

  def index
    @articles = Article.where(
      id: Entry.articles.pluck(:entryable_id)
    ).includes(:comments)
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @entry = Entry.create!(entryable: Article.new(article_params), account: @account)

    if @entry.save

      redirect_to @entry # `direct :entry` in `routes.rb`
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def prepare_article
    @article ||= Article.where(id: @account.entries.articles.pluck(:entryable_id)).find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :status)
  end
end
