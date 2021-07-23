def all_words_capitalized?(words)
    words.all? { |word| word == word.capitalize }
end

def no_valid_url?(urls)
    urls.none? do |url|
        url.include?(".com") || url.include?(".net") || url.include?(".io") || url.include?(".org")
    end
end

def any_passing_students?(students)
    students.any? { |student| student[:grades].sum / (student[:grades].length * 1.0) >= 75 } 
end