Warbler::Config.new do |config|
  config.dirs = %w(lib views models)
  config.includes = FileList["appengine-web.xml", "app.rb", "config.ru"]
  
  config.gems = ['sinatra', 'haml','appengine-apis']
  config.gem_dependencies = true
  
  config.war_name = "test"
  
  config.webxml.booter = :rack
  
  config.webxml.jruby.min.runtimes = 1
  config.webxml.jruby.max.runtimes = 1
  config.webxml.jruby.init.serial = true
  
  config.java_libs = []
end
