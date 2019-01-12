require "yaml"
require "pry"

def load_library(file_path)
  emoticons_raw = YAML.load_file(file_path)
  emoticons_lib = { "get_meaning" => {}, "get_emoticon" => {} }
  emoticons_raw.each do |name, emoji|
    emoticons_lib["get_meaning"][emoji[1]] = name
    emoticons_lib["get_emoticon"][emoji[0]] = emoji[1]
  end
  emoticons_lib
end

def get_japanese_emoticon(file_path, eng_emoji)
  emoji_lib = load_library(file_path)
  match = emoji_lib["get_emoticon"].find{|emoji| emoji[0] == eng_emoji }
  match ? match[1] : "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, jap_emoji)
  emoji_lib = load_library(file_path)
  match = emoji_lib["get_meaning"].find{|emoji| emoji[0] == jap_emoji }
  match ? match[1] : "Sorry, that emoticon was not found"
end
