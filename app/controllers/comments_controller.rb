# frozen_string_literal: true

# comments controller
class CommentsController < ApplicationController
  before_action :prepare_account
  before_action :prepare_article
  before_action :prepare_comment, only: %i(archive destroy)

  def create
    comment = @article.comments.create!(comment_params)
    Entry.create!(entryable: comment)

    byebug
    redirect_to article_path(@article)
  end

  def archive
    @comment.archived!
    redirect_to article_path(@article), status: :see_other
  end

  def destroy
    @comment.entry.destroy
    redirect_to article_path(@article), status: :see_other
  end

  private

  def prepare_comment
    @comment ||= @article.comments.find(params[:id])
  end

  def prepare_article
    @article ||= Article.where(id: @account.entries.articles.pluck(:entryable_id)).find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:commenter, :content, :status)
  end
end
