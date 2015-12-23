class NotesController < ApplicationController

  def create
    @resource = current_user.resources.find(params[:note][:resource_id])
    @note = @resource.notes.build(note_params)
    if @note.save
      flash[:success] = 'Note added'
      redirect_to @resource
    else
      render 'resources/show'
    end
  end

  private

  def note_params
    params.require(:note).permit(:text)
  end
end
