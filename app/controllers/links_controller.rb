class LinksController < ApplicationController
  before_filter :find_folder
  before_filter :find_link, :only => [:edit, :show, :update, :destroy]
  
  def index
    redirect_to folder_path(@folder)
  end
  
  def new
    @link = @folder.links.build
  end

  def create
    @link = @folder.links.build(params[:link])
    if @link.save
      title = @link.title
      flash[:notice] = "Your link #{title} has been created."
      redirect_to folder_path(@folder)
    else
      flash[:alert] = "Your link has not been created."
      render :action => :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  
  def find_folder
   @folder = Folder.find(params[:folder_id]) 
  end
    
  def find_link
    @link = @folders.links.find(params[:id])
  end
end
