require 'csv'
require_relative 'translation'
require "active_support/all"

# collection of translations
class Translations
    attr_reader :translations
    def initialize
        @translations = []
    end

    def read_from_csv_file(filename)
        CSV.foreach(filename, headers: true) do |row|
          @translations << Translation.new(row['Word'], row['Translation'], row['Synonyms'])
        end
    end

    def each_to_print       
        @translations.each do |value|
          puts value.to_s.mb_chars
        end
    end

    def at(index)
        @translations[index]
    end

    def print_translation_with_synonyms(word)
        flag = false
        @translations.each do |value|
            if(word.mb_chars.downcase == value.word)
                print 'Translation:'
                puts value.translation.to_s
                print 'Synonyms:'
                puts value.synonyms.to_s
                flag=true
            end
        end
        if(!flag)
            puts 'Unknown word'
        end
    end

    def print_words_starts_with_letter(letter)
        flag = false
        puts 'Words for this letter:'
        @translations.each do |value|
            if(value.word.slice(0..letter.size-1) == letter.mb_chars.downcase)
                puts value.word
                flag=true
            end
        end
        if(!flag)
            puts 'No words for the given letter'
        end
    end

    def print_words_translation(words)
        words = words.split(' ')
        puts 'Translation of words:'
        result = ""
        flag = false
        words.each do |word|
            flag = false
            @translations.each do |translation|
                if(word.mb_chars.downcase == translation.word)
                    result = result + translation.translation + ' '
                    flag = true                
                end
            end
            if(!flag)
                puts 'Word ' + word + ' missing in the translation list'
            end
        end 
        puts result       
    end
end

