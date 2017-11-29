class LikesController < ApplicationController

  def new
    @like = Like.new(like_params)
  end

  def create
    @user = current_user.id
    @note = params[:note_id]
    note = Note.find(@note)
    likes = {user_id: @user,note_id: @note }
    @like = Like.new(likes)
    @like.save!
    redirect_to user_path(note.user_id)
  end

  def destroy
    @user = current_user.id
    @note = params[:note_id]
    note = Note.find(@note)
    record = Like.where("user_id = ? and note_id = ?", @user, @note)
    recordss = record.ids.first
    Like.destroy(recordss)
    redirect_to user_path(note.user_id)
  end

  def like_params
      params.require(:likes).permit(:user_id, :note_id)
  end
end
