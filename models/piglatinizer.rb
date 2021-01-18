class PigLatinizer
    
    def piglatinize(user_phrase)
        # binding.pry
        @user_phrase = user_phrase
        phrase_array = user_phrase.split(" ")
      #if user phrase has an array count of greater than 1 then 
      if phrase_array.count > 1
        @user_phrase = sentence(user_phrase)
      else 
        @user_phrase = word_prep(user_phrase)
        #if user phrase has an array count of 1 then 
      end
      @user_phrase
    end

    def word_prep(word)
        vowels = ["a", "e", "i", "o", "u","I", "E", "O", "U", "A"]    
        word_array = word.split("")
        triple_consonant = !vowels.include?(word_array[0]) && !vowels.include?(word_array[1]) && !vowels.include?(word_array[2])
        double_consonant = !vowels.include?(word_array[0]) && !vowels.include?(word_array[1])

        if vowels.include?(word_array.first)
            pig_word = "#{word_array.join()}way"
        elsif triple_consonant
            pig_word = "#{word_array.rotate(3).join()}ay"
        elsif double_consonant
            pig_word = "#{word_array.rotate(2).join()}ay"
        else 
            pig_word = "#{word_array.rotate(1).join()}ay"
        end
        pig_word
    end

    def sentence(user_phrase)
        array = []
        user_phrase.split(" ").collect do |word|
            array << word_prep(word)
        end
        array.join(" ")
    end
    
end
