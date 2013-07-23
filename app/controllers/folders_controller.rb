class FoldersController < ApplicationController
  def index
    @folders = Folder.all
  end
  
  def new
    @folder = Folder.new
  end

  def create
    @folder = Folder.new(params[:folder])
    title = @folder.name
    if @folder.save
      flash[:notice] = "Your folder #{title} has been created."
      redirect_to folders_path
    else
      flash[:alert] = "Your folder has not been created."
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end
end
