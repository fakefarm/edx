class Caesar

  def initialize(string)
    @string = string
  end

  def encrypt(key)
    new_string = ""
    upcase = false

    @string.each_char do |char|
      ascii_value = char.sum

      if ascii_value < 64 || ascii_value > 122
        new_string += char
        next
      end

      upcase = false unless char.upcase == char

      if upcase
        lower_bound = 64
        upper_bound = 90
      else
        lower_bound = 96
        upper_bound = 122
      end

      encrypted_ascii_value = ascii_value + key

      if encrypted_ascii_value > upper_bound
        if (lower_bound + (encrypted_ascii_value - upper_bound)) > upper_bound
          encrypted_ascii_value = (lower_bound + (encrypted_ascii_value - upper_bound))
          new_string += get_encrypted_value_for(lower_bound, upper_bound, encrypted_ascii_value)
        else
          new_string += (lower_bound + (encrypted_ascii_value - upper_bound)).chr
        end
      else
        new_string += (char.sum + key).chr
      end

    end
    new_string
  end

  private

  def get_encrypted_value_for(lower_bound, upper_bound, encrypted_ascii_value)
    encrypted_ascii_value = (encrypted_ascii_value - upper_bound)
    if (lower_bound + encrypted_ascii_value) > upper_bound
      get_encrypted_value_for(lower_bound, upper_bound, encrypted_ascii_value + lower_bound)
    else
      char = (lower_bound + encrypted_ascii_value).chr
      char
    end
  end
end