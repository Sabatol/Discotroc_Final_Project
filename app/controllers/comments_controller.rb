class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_completed?

  def new
    @new_comment = Comment.new()
    @deal = Deal.find_by(id: params[:deal_id])
  end

  def create
    @new_comment = Comment.new(content: params[:content], comment_sender_id: params[:comment_sender_id], comment_receiver_id: params[:comment_receiver_id], deal_id: params[:deal_id])
    if @new_comment.save
      flash[:notice_good] = "Le commentaire a bien été créé"
      redirect_to deal_path(@new_comment.deal_id)
    else
      flash[:notice_bad] = "Le commentaire n'a pas été créé"
      render 'new'
    end
  end

  def destroy
    @comment_to_destroy = Comment.find(params[:id])
    @comment_to_destroy.destroy
    redirect_to root_path
  end
end
