class DateTime
  def self.from_filetime(t)
    unix_time = (t-11644473600000000)/1000000
    Time.at(unix_time).to_datetime
  end

  def to_filetime
    (self.to_i*1000000 + 11644473600000000)
  end
end
