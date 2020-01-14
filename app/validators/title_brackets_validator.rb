class TitleBracketsValidator < ActiveModel::Validator
  def validate(record)
    stack  = []
    brackets = { 
      '(' => ')',
      '[' => ']',
      '{' => '}'
    }
    left_brackets   = brackets.keys
    right_brackets  = brackets.values
    string = record.title
    left_bracket_char_position = 0

    string.each_char.with_index do |char, i|
      if left_brackets.include? char
        stack << char
        left_bracket_char_position = i
      elsif right_brackets.include? char
        # error if stack empty || two same ()[]{} brackets next to each other with no space between them || values of bracket['('] => ')' and char => ']' are different
        is_invalid(record) if stack.empty? || ((left_bracket_char_position + 1) == i) || (brackets[stack.pop] != char)
      end
    end

    # left brackets
    if stack.length > 0
      is_invalid(record)
    elsif stack.empty?
      return true
    end
  end

  def is_invalid(record)
    record.errors.add(:title, "Invalid title")
  end

end