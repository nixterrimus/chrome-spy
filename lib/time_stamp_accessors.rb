module TimestampAccessors
  def filetime(*attributes)
    attributes.each do |attribute|
      name = attribute.to_s

      define_method(name) {
        filetime = read_attribute(name)
        DateTime.from_filetime(filetime)
      }

      define_method(name+'=') { |datetime|
        write_attribute(name, datetime.to_filetime)
      }
    end
  end
end
ActiveRecord::Base.extend(TimestampAccessors)
