class Site
  include Mongoid::Document
  include Mongoid::Timestamps
  field :url, :type => String
  field :name, :type => String
  
  validates_presence_of :url
  validates_uniqueness_of :url, :case_sensitive => false

  before_create :get_name
  
  def self.create_from_url(url)
    
    site = Site.find_or_create_by(:url => url)

    site
    
  end

  protected
  def get_name

    begin 
    
      require 'hpricot'
      require 'open-uri'
    
      doc = Hpricot(open(self.url.httpize))
      self.name = doc.at('title').to_plain_text

    rescue
      
      self.name = self.url.dehttpize
      
    end
    
  end
  
end
