###
#  to run use
#     ruby -I . match/test_match_euro.rb


require 'helper'


class TestMatchEuro < MiniTest::Test

  def test_parse
    txt, exp, teams = read_test( 'match/euro_2016.txt' )

    start = Date.new( 2016, 1, 1 )

    SportDb::Import.config.lang = 'en'

    parser = SportDb::MatchParser.new( txt, teams, start )
    matches, rounds, groups  = parser.parse

    pp rounds
    pp groups
    pp matches[-1]     ## only dump last record for now
  end   # method test_parse
end   # class TestMatchEuro
