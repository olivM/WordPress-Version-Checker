class Site
  include Mongoid::Document
  include Mongoid::Timestamps
  field :url, :type => String
  field :name, :type => String
  
  
end
