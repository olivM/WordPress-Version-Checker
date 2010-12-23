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
    
    redirect_to :action => :show, :id => site.url
    
  end
  
  def show
    
    @site = Site.find(:url => params[:id])
    
  end

  def edit
    
    @site = Site.create_from_url(params[:site][:url])
    
  end

end
