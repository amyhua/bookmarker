class FoldersController < ApplicationController
  before_filter :find_folder, :only => [:edit, :update, :destroy, :show]
  before_filter :all_folders
  def index
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
    if @folder.update_attributes(params[:folder])
      flash[:notice] = "Your folder has been updated."
      redirect_to folders_path
    else
      flash[:alert] = "Your folder has not been updated."
      render :action => :edit
    end
    
  end

  def destroy
    name = @folder.name
    @folder.destroy
    @folders = Folder.all
    flash[:notice] = "Your folder #{name} has been deleted."
    redirect_to folders_path
  end

  def show
  end
  
  private
  
  def find_folder
    @folder = Folder.find(params[:id])
  end
  
  def all_folders
    @folders = Folder.all
  end
end
