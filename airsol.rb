#! /bin/env ruby
# encoding: utf-8

require "fileutils"
require "kramdown"
require "mustache"
require "yaml"

# setup vars

media = ["css", "img", "js"]
domains = ["chaudieres", "photovoltaique", "poeles", "thermique"]

# load yaml files

yml = (["base", "home"].concat domains).map! { |file|
    [file, (YAML::load (File::read "yml/#{ file }.yml"))]
  }
yml = Hash[yml]

# markdown to html
# there is probably a clean way, but for now I wont settle for a complicated and
# still dirty way, which is the only one that occurs to my mind, so no.

def toHTML (markdown)
  Kramdown::Document.new(markdown).to_html
end

yml["base"]["domainList"].each_index {|domain|
  yml["base"]["domainList"][domain]["domainTitle"] = toHTML yml["base"]["domainList"][domain]["domainTitle"]
}
yml["base"]["linkColList"].each_index {|col|
  yml["base"]["linkColList"][col]["linkCol"].each_index {|row|
    yml["base"]["linkColList"][col]["linkCol"][row]["linkList"].each_index {|link|
      yml["base"]["linkColList"][col]["linkCol"][row]["linkList"][link] = toHTML yml["base"]["linkColList"][col]["linkCol"][row]["linkList"][link]
    }
  }
}
yml["home"]["about"] = toHTML yml["home"]["about"]
yml["home"]["news"] = toHTML yml["home"]["news"]
domains.each {|domain|
  yml[domain]["domainInfo"].each_index {|info|
    yml[domain]["domainInfo"][info]["infoBody"] = toHTML yml[domain]["domainInfo"][info]["infoBody"]
  }
  yml[domain]["workList"].each_index {|work|
    yml[domain]["workList"][work]["workDesc"] = toHTML yml[domain]["workList"][work]["workDesc"]
    tableWidth = 0
    yml[domain]["workList"][work]["workTable"].each_index {|row|
      if yml[domain]["workList"][work]["workTable"][row]["tableRow"].length > tableWidth
        then tableWidth = yml[domain]["workList"][work]["workTable"][row]["tableRow"].length
      end
    }
    yml[domain]["workList"][work]["workTable"].each_index {|row|
      if yml[domain]["workList"][work]["workTable"][row]["tableRow"].length < tableWidth
        then yml[domain]["workList"][work]["workTable"][row]["tableCellWidth"] = tableWidth - yml[domain]["workList"][work]["workTable"][row]["tableRow"].length + 1
      end
    }
  }
}

# clean and copy

FileUtils.rm_r (Dir.glob "static/*")
media.each {|dir|
  Dir.mkdir "static/#{ dir }"
  FileUtils.cp_r "#{ dir }/.", "static/#{ dir }/."
}

# render and write

homeParams = yml["base"].merge yml["home"]
homeParams["pageBody"] = Mustache.render(File.read("mustache/home.mustache"), homeParams)
File.write("static/index.html", Mustache.render(File.read("mustache/base.mustache"), homeParams))
puts "airsol44/"

domains.each {|domain|
  Dir.mkdir "static/#{ domain }"
  params = yml["base"].merge yml[domain]
  params["domainList"].each_index {|d|
    if params["domainList"][d]["domainName"] == domain
      then
        params["domainList"][d]["domainActive"] = true
      else params["domainList"][d]["domainActive"] = false
    end
  }
  params["pageBody"] = Mustache.render(File.read("mustache/domain.mustache"), params)
  File.write("static/#{ domain }/index.html", Mustache.render(File.read("mustache/base.mustache"), params))
  puts ".. #{ domain } (#{ yml[domain]["workList"].length })"
}
