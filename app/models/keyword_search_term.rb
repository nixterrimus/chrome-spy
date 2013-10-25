# join model
class KeywordSearchTerm < ActiveRecord::Base
  # t.integer "keyword_id",                :null => false
  # t.integer "url_id",                    :null => false
  # t.string  "lower_term", :limit => nil, :null => false
  # t.string  "term",       :limit => nil, :null => false
  self.primary_key = "keyword_id"
  belongs_to :url
end
