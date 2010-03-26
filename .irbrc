require 'irb/completion'
require 'irb/ext/save-history'
require 'rubygems'

ARGV.concat %w(--readline --prompt-mode simple)
IRB.conf[:SAVE_HISTORY] = 25
IRB.conf[:HISTORY_FILE] = "#{ENV["HOME"]}/.irb-history"
IRB.conf[:AUTO_INDENT] = true

if File.exist?('./init.rb')
  puts "Requiring ./init.rb"
  require './init.rb'
end

at_exit do
  puts
end
