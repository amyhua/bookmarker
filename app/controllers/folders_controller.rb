class FoldersController < ApplicationController
  
  before_filter :find_folder, :only => [:edit, :update, :destroy, :show]
  before_filter :get_folders
  
  def index
    @links = Link.all
  end
  
  def new
    if params[:parentname].nil?
      @folder = Folder.new(:parentname => "All")
    else
      @folder = Folder.new(:parentname => params[:parentname])
    end
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
  
  def get_folders
    if @root.nil?
      @root = Folder.new(:name => "All", :parentname => "All")
      @root.save      
    end
    @folders = Folder.where("name <> 'All'")
  end
end
