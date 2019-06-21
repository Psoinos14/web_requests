require 'http'

p "please enter a type of animal you would like to know about."

animal = gets.chomp

response = HTTP.get("https://api.wordnik.com/v4/word.json/#{animal}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=YOURAPIKEY")

word1 = response.parse[0]["word"]
partofspeech1 = response.parse[0]["partOfSpeech"]
description1 = response.parse[0]["text"]
description2 = response.parse[1]["text"]
partofspeech2 = response.parse[1]["partOfSpeech"]




response2 = HTTP.get("https://api.wordnik.com/v4/word.json/#{animal}/pronunciations?useCanonical=false&limit=50&api_key=YOURAPIKEY")



parse2 = response2.parse

pronounciation = parse2[0]["raw"]

response3 = HTTP.get("https://api.wordnik.com/v4/word.json/#{animal}/examples?includeDuplicates=false&useCanonical=false&limit=5&api_key=YOURAPIKEY")

parse3 = response3.parse
# p 

top_example = parse3["examples"][0]["text"]
p "Your animal you wanted to know more about was #{word1}. The pronounciation of this word is #{pronounciation}. One definition of this animal is '#{description1}'. The part of speech of this definition is #{partofspeech1}. Another definition is '#{description2}' The part of speech of this definition is #{partofspeech2}. The top example is '#{top_example}'."

