class Visit < ActiveRecord::Base
  # t.integer "url",                       :null => false
  # t.integer "visit_time",                :null => false
  # t.integer "from_visit" ???
  # t.integer "transition", :default => 0, :null => false
  # t.integer "segment_id"
  # t.boolean "is_indexed"

  filetime :visit_time
  belongs_to :url, :foreign_key => 'url'
  belongs_to :segment
end
