class NotesController < ApplicationController
  before_action :authenticate_user!

  def new
    @note = Note.new
  end

  def create
    @note = current_user.notes.new(note_params)
    if @note.save
      redirect_to notes_path
    else
      render 'new'
    end
  end

  def edit
    @note = current_user.notes.find(params[:id])
  end

  def update
    @note = current_user.notes.find(params[:id])
    if @note.update(note_params)
      redirect_to notes_path(@note)
    else
      render 'edit'
    end
  end

  def destroy
     @note = current_user.notes.find(params[:id])
     @note.destroy
     redirect_to notes_path
  end

  def index
    @notes = Note.all
  end

  private

  def note_params
    params.require(:note).permit(:title, :body)
  end
end
