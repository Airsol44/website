#! /bin/env ruby
# encoding: utf-8

require "fileutils"
require "kramdown"
require "mustache"
require "yaml"

airsol = YAML::load (File::read "airsol.yml")

airsol["about"] = Kramdown::Document.new(airsol["about"]).to_html
airsol["news"] = Kramdown::Document.new(airsol["news"]).to_html
airsol["suppliers"].each_index { |i|
  airsol["suppliers"][i]["list"].each_index { |j|
    airsol["suppliers"][i]["list"][j] = Kramdown::Document.new(airsol["suppliers"][i]["list"][j]).to_html
  }
}
airsol["tools"].each_index { |i|
  airsol["tools"][i]["list"].each_index { |j|
    airsol["tools"][i]["list"][j] = Kramdown::Document.new(airsol["tools"][i]["list"][j]).to_html
  }
}

FileUtils.rm_r (Dir.glob "out/*")
FileUtils.cp_r "src/.", "out/."

File.write("out/index.html", Mustache.render(File.read("tpl/home.html"), airsol))
