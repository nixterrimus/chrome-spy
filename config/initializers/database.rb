class File
  def temporary_clone
    tempfile = Tempfile.new(self.class.basename(self))
    FileUtils.copy_stream(self, tempfile)
    tempfile
  end
end

history_path = "~/Library/Application Support/Google/Chrome/Default/History"
history_full_path = File.expand_path(history_path)
history_file = File.open(history_full_path, 'rb')
history_file_clone = history_file.temporary_clone

ActiveRecord::Base.establish_connection({
  :adapter => "sqlite3",
  :database => history_file_clone.path
})
