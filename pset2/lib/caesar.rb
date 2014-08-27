class Caesar

  def initialize(string)
    @string = string
  end

  def encrypt(key)
    new_string = ""
    upcase = false
    @string.each_char do |char|

      if char.sum < 64 || char.sum > 122
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

      ascii_value = char.sum

      sum = ascii_value + key

      if sum > upper_bound
        if (lower_bound + (sum - upper_bound)) > upper_bound
          value = (lower_bound + (sum - upper_bound))
          new_string += get_encrypted_value_for(lower_bound, upper_bound, value)
        else
          new_string += (lower_bound + (sum - upper_bound)).chr
        end
      else
        new_string += (char.sum + key).chr
      end

    end
    new_string
  end

  private

  def get_encrypted_value_for(lower_bound, upper_bound, value)
    remainder = (value - upper_bound)
    if (lower_bound + remainder) > upper_bound
      get_encrypted_value_for(lower_bound, upper_bound, remainder + lower_bound)
    else
      char = (lower_bound + remainder).chr
      char
    end
  end
end