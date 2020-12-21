module WordsHelper
  def small_word_tag(word)
    tag.i(word, class: "small-word small-word-#{word.downcase}")
  end

  def space
    ' '
  end
end
