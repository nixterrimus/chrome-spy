class Url < ActiveRecord::Base
  # t.string  "url",             :limit => nil
  # t.string  "title",           :limit => nil
  # t.integer "visit_count",                    :default => 0, :null => false  # seems out of sync
  # t.integer "typed_count",                    :default => 0, :null => false
  # t.integer "last_visit_time",                               :null => false
  # t.integer "hidden",                         :default => 0, :null => false
  # t.integer "favicon_id",                     :default => 0, :null => false
  filetime :last_visit_time
  has_many :visits, :foreign_key => "url"
end
