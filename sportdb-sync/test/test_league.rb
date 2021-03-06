# encoding: utf-8

###
#  to run use
#     ruby -I ./lib -I ./test test/test_league.rb


require 'helper'

class TestLeague < MiniTest::Test

  League = SportDb::Sync::League


  def test_search
    rec = League.search_or_create!( 'eng' )
    assert_equal 'Premier League',  rec.name
    assert_equal 'eng.1',           rec.key
    assert_equal 'eng',             rec.country.key
    assert_equal 'England',         rec.country.name
    # assert_equal true,              rec.clubs

    rec = League.search!( 'eng' )
    assert_equal 'Premier League',  rec.name
    assert_equal 'eng.1',           rec.key
    assert_equal 'eng',             rec.country.key
    assert_equal 'England',         rec.country.name
    ## assert_equal true,              rec.clubs

    ## try 2nd call (just lookup)
    rec = League.search_or_create!( 'eng' )
    assert_equal 'Premier League', rec.name
    assert_equal 'eng.1',          rec.key
    assert_equal 'eng',            rec.country.key
    assert_equal 'England',        rec.country.name
    ## assert_equal true,                 rec.clubs
  end
end # class TestLeague
