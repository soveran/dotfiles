require 'irb/completion'
require 'irb/ext/save-history'
require 'rubygems'

IRB.conf[:SAVE_HISTORY] = 25
IRB.conf[:HISTORY_FILE] = "#{ENV["HOME"]}/.irb-history"
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:PROMPT_MODE] = :SIMPLE

at_exit do
  puts
end
