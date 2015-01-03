# encoding: utf-8
class CommentsController < ApplicationController
  before_action :correct_user, only: :destroy

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Комментарий создан!"
    else
      flash[:error] = "Ошибка при создании комментария!"
    end
    redirect_to recipe_path(comment_params[:recipe_id])
  end

  def destroy
    @comment.destroy
    flash[:success] = "Комментарий удален!"
    redirect_to recipe_path(params[:recipe_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :recipe_id)
  end

  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
    redirect_to root_url if @comment.nil?
  end
end