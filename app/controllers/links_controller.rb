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
    @link.timestamp = Time.now.to_i
    unless @link.url.include? "http://"
      url = 'http://' + @link.url
      @link.url = url
    end
    if @link.save
      title = @link.title
      flash[:notice] = "Your link #{title} has been created."
      redirect_to folder_path(@folder)
    else
      flash[:alert] = "Your link has not been created."
      render :action => :new
    end
  end

  def edit
  end

  def update
    @link.timestamp = Time.now.to_i
    if @link.update_attributes(params[:link])
      flash[:notice] = "Your link has been updated."
      redirect_to folders_path
    else
      flash[:alert] = "Your link has not been updated."
      render :action => :edit
    end 
  end

  def destroy
  end
  
  private
  
  def find_folder
   @folder = Folder.find(params[:folder_id]) 
  end
    
  def find_link
    @link = @folder.links.find(params[:id])
  end
  
  def find_folder_links
    @links = @folder.links
    @links.sort! { |a,b| a.title.downcase <=> b.title.downcase }
  end
end
