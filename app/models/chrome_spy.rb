class ChromeSpy
  class <<self
    def recent_searches
      KeywordSearchTerm.includes('url').order('urls.last_visit_time desc').each { |t| puts t.term }
      nil
    end

    def most_frequent_sites
      Url.order('visit_count desc').limit(5).each { |u| puts "visit count: #{u.visit_count} - #{u.url}" }
      nil
    end

    def most_frequently_typed_addresses
      Url.order('typed_count desc').limit(5).each { |u| puts "typed count: #{u.typed_count} - #{u.url}" }
      nil
    end

    def recent_downloads
      Download.limit(5).all.each { |d| puts "bytes: #{d.total_bytes} path: #{d.full_path}" }
      nil
    end
  end
end
