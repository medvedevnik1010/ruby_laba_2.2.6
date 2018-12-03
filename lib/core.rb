require_relative 'translations'
require "active_support/all"

# manage of application
class Core
    def run
      puts
      puts 'Task 2.2.6 Medvedev Nikita IT-41'
      puts
      en_ru_translations = Translations.new
      ru_en_translations = Translations.new       
      en_ru_translations.read_from_csv_file('../data/en_ru_translations.csv')
      ru_en_translations.read_from_csv_file('../data/ru_en_translations.csv')
      print_all_translations(en_ru_translations)
      test(en_ru_translations)
    end

    def print_all_translations(translations)
        puts 'All translations: '
        translations.each_to_print
    end    

    def test(translations)
        #puts 'Enter russian hello'
        #ru_hello = gets.strip.encode!("utf-8")
        #if(en_ru_translations.at(0).translation == ru_hello.mb_chars.downcase)
        #    puts 'uspeh'
        #end

        #puts 'Enter word for translation'
        #word = gets.strip.encode!("utf-8")
        #en_ru_translations.print_translation_with_synonyms(word.mb_chars.downcase)

        #puts 'Enter letter for search words'
        #letter = gets.strip.encode!("utf-8")
        #translations.print_words_starts_with_letter(letter)

        puts 'Enter words for translation'
        words = gets.strip.encode!("utf-8")
        translations.print_words_translation(words)
    end
end