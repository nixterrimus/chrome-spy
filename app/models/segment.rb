class Segment < ActiveRecord::Base
  belongs_to :url
  has_many :segment_usages
end
