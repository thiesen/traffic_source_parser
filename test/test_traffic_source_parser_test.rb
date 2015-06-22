require 'minitest_helper'

class TestTrafficSourceParser < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::TrafficSourceParser::VERSION
  end

  def test_that_parser_returns_the_correct_social_media_source
    assert_equal "Facebook", TrafficSourceParser.parse("https://www.facebook.com/").csr
    assert_equal "Twitter", TrafficSourceParser.parse("http://t.co/W1pX6dNa2V").csr
    assert_equal "LinkedIn", TrafficSourceParser.parse("https://www.linkedin.com/").csr
    assert_equal "Google Plus", TrafficSourceParser.parse("http://plus.url.google.com/url" +
                                                          "?sa=j&url=http%3A%2F%2Fbit.ly" +
                                                          "%2F4thofJulyPartyIdeas&uct=" +
                                                          "1434564324&usg=" +
                                                          "EGzOjzYKd_AM9NR0icjtoT1p_54").csr
    assert_equal "Pinterest", TrafficSourceParser.parse("https://www.pinterest.com/").csr
  end

end