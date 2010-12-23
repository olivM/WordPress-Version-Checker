class Site
  include Mongoid::Document
  include Mongoid::Timestamps
  field :url, :type => String
  field :name, :type => String
  
  def self.create_from_url(url)
    
    site = Site.create(:url => url)
    
    site
    
  end
  
end
