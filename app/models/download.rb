class Download < ActiveRecord::Base
  # t.string  "full_path",      :limit => nil, :null => false
  # t.string  "url",            :limit => nil, :null => false
  # t.integer "start_time",                    :null => false
  # t.integer "received_bytes",                :null => false
  # t.integer "total_bytes",                   :null => false
  # t.integer "state",                         :null => false

  filetime :start_time
end
