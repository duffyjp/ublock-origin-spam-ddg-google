#!/usr/bin/ruby

blocklist = []
domains   = []

File.open("./domains.txt", "r").read.lines.each do |line|
  next if ['#', nil].include? line.strip[0]

  domains   << line.strip
  blocklist << %Q|duckduckgo.*##.results > div:has(a[href*="#{line.strip}"])|
  blocklist << %Q|google.*##.g:has(a[href*="#{line.strip}"])|
end

File.write("blocklist.txt", blocklist.sort.join("\n") + "\n")
File.write("domains.txt", "# Add list of domains to block here.\n\n" + domains.sort.join("\n") + "\n")
