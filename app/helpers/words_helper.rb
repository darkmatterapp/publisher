module WordsHelper
  def small_word_tag(word)
    content_tag(:i, word, class: "small-word small-word-#{word.downcase}")
  end

  def space
    " "
  end
end
