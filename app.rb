require 'bundler/setup'
Bundler.require(:default)

project_root = File.dirname(File.absolute_path(__FILE__))
Dir.glob(project_root + "/config/initializers/*.rb").each{|f| require f}
Dir.glob(project_root + "/lib/*.rb").each{|f| require f}
Dir.glob(project_root + "/app/models/*.rb").each{|f| require f}
