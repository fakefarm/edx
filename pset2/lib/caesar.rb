class Caesar

  attr_reader :phrase, :ordinal_phrase

  def initialize phrase
    @phrase = prepare phrase
  end

  def encrypt key
    encrypt_phrase key
  end

private

  def encrypt_phrase key
    convert_phrase_to_ordinal
    convert_ordinal_to_secret key
  end

  def convert_phrase_to_ordinal
    @ordinal_phrase ||= phrase.map { |letter| letter.ord }
  end

  def convert_ordinal_to_secret key
    code = ordinal_phrase.map do |letter|
      if is_uppercase? letter
        encrypt_uppercase letter, key
      elsif is_lowercase? letter
        encrypt_lowercase letter, key
      else
        approved_as_is letter
      end
    end
    code.join('')
  end

  def prepare phrase
    phrase.split('')
  end

  def is_uppercase? letter
    (65..90).include? letter
  end

  def is_lowercase? letter
    (97..122).include? letter
  end

  def approved_as_is letter
    letter.chr
  end

  def encrypt_uppercase letter, key
    total = letter + key
    if total > 90
      key = (total - 90) % 26
      total = 65 + key
      total.chr
    else
      total.chr
    end
  end

  def encrypt_lowercase letter, key
    total = letter + key
    if total > 122
      new_key = (total - 122) % 26
      total = 96 + new_key
      total.chr
    else
      total.chr
    end
  end
end
