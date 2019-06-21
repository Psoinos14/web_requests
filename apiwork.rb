require 'http'

p "please enter a type of animal you would like to know about."

animal = gets.chomp

response = HTTP.get("https://api.wordnik.com/v4/word.json/#{animal}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=YOURAPIKEY")

word1 = response.parse[0]["word"]
partofspeech1 = response.parse[0]["partOfSpeech"]
description1 = response.parse[0]["text"]
description2 = response.parse[1]["text"]
partofspeech2 = response.parse[1]["partOfSpeech"]

p "Your animal you wanted to know more about was #{word1}. One definition of this animal is '#{description1}'. The part of speech of this definition is #{partofspeech1}. Another definition is '#{description2}' The part of speech of this definition is #{partofspeech2}."
