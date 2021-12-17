#!/usr/bin/ruby

blocklist = []

File.open("./domains.txt", "r").read.lines.each do |line|
  next if ['#', nil].include? line.strip[0]

  blocklist << %Q|duckduckgo.*##.results > div:has(a[href*="#{line.strip}"])|
  blocklist << %Q|google.*##.g:has(a[href*="#{line.strip}"])|
end

File.write("blocklist.txt", blocklist.sort.join("\n") + "\n")
