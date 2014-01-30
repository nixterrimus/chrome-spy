#!/usr/bin/env ruby

# This script dumps out interesting aggregate data about your chrome usage.
require 'rubygems'
require 'sqlite3'
require 'active_record'
require 'pry'

# If you'd like to see the entire schema...
# puts ActiveRecord::SchemaDumper.dump

module TimestampAccessors
  def timestamp_accessors(*attributes)
    attributes.each do |attr|
      name = attr.to_s

      # Some timestamps have 17 digits
      # Since 10000000000 is year 2286, so I'm assuming that no dates are longer
      # than 10 digits
      define_method(name) {
        raw = read_attribute(name).to_s.slice(0, 10)
        Time.at(raw.to_i)
      }

      define_method(name+'=') { |t|
        write_attribute(name, t.to_i)
      }
    end
  end
end
ActiveRecord::Base.extend(TimestampAccessors)
















class ChromeSpy
  class <<self
    def recent_searches
      KeywordSearchTerm.includes('url').order('urls.last_visit_time desc').each { |t| puts t.term }
      nil
    end

    def most_frequent_sites
      Url.order('visit_count desc').limit(5).all.each { |u| puts "visit count: #{u.visit_count} - #{u.url}" }
      nil
    end

    def most_frequently_typed_addresses
      Url.order('typed_count desc').limit(5).all.each { |u| puts "typed count: #{u.typed_count} - #{u.url}" }
      nil
    end

    def recent_downloads
      Download.limit(5).all.each { |d| puts "bytes: #{d.total_bytes} path: #{d.full_path}" }
      nil
    end
  end
end

binding.pry
