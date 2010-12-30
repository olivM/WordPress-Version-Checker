class SitesController < ApplicationController
  before_filter :authenticate_user!

  def index

    @sites = Site.all

  end
  
  def new
    
    @site = Site.new
    
  end
  
  def create
    
    site = Site.create_from_url(params[:site][:url])
    
    redirect_to edit_site_path(site)
    
  end
  
  def show
    
    @site = Site.find(params[:id])
    
  end

  def edit
    
    @site = Site.find(params[:id])
    
  end

  def update

    site = Site.find(params[:id])
    
    site.update_attributes(:name => params[:site][:name])
  
    redirect_to site_path(site)
  
  end
    
  
  def destroy
    
    Site.find(params[:id]).destroy
    
    redirect_to sites_path
    
  end

end
