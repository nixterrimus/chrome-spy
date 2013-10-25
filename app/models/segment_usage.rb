class SegmentUsage < ActiveRecord::Base
  # t.integer "segment_id",                 :null => false
  # t.integer "time_slot",                  :null => false
  # t.integer "visit_count", :default => 0, :null => false
  self.table_name = "segment_usage"
  belongs_to :segment
  filetime :time_slot
end
