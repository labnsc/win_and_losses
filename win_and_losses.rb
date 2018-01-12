require 'optparse'

require_relative 'lib/line_parser'

options = {}
OptionParser.new do |opts|
  opts.banner = 'Usage: win_and_losses.rb [options]'

  opts.on('-f', '--file FILE', 'file') do |file|
    options[:file] = file
  end
end.parse!

lines = File.readlines(options[:file])
output = File.open("win-losses-#{options[:file]}", 'w')

lines.each do |line|
  unless line =~ /^Mk\d+\=S/i
    output << line
    next
  end

  parsed_line = LineParser.call(line)

  output << parsed_line
end

output.close
