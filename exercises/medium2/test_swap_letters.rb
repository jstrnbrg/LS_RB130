require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'swap_letters'


class TextTest < MiniTest::Test
  def setup
    @file = File.open('swap_sample.txt')
    @text_from_file = @file.read
    @text = Text.new(@text_from_file)
  end

  def test_swap
    count_e = @text_from_file.count('e')
    count_a = @text_from_file.count('a')
    # no letters lost or added
    assert_equal(@text_from_file.size, @text.swap('a', 'e').size)
    # as many e's after swap as there were both a's and e's before
    assert_equal(count_e + count_a, @text.swap('a', 'e').count('e'))
    # no a's left
    assert_equal(0, @text.swap('a', 'e').count('a'))
  end

  def test_word_count
    word_count = @text_from_file.split(" ").count
    assert_equal(word_count, @text.word_count)
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
end
