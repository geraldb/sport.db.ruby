# encoding: utf-8

###
#  to run use
#     ruby -I ./lib -I ./test test/test_datafile_package.rb


require 'helper'


class TestDatafilePackage < MiniTest::Test

  def test_read
    [Datafile::DirPackage.new( '../../../openfootball/england' ),
     Datafile::ZipPackage.new( 'tmp/england-master.zip' )
    ].each do |eng|
       assert eng.find( '2015-16/.conf.txt' ).read.start_with?( '= English Premier League 2015/16' )
       assert eng.find( '2017-18/.conf.txt' ).read.start_with?( '= English Premier League 2017/18' )
       assert eng.find( '2015-16/1-premierleague.txt' ).read.start_with?( '= English Premier League 2015/16' )
    end

    [Datafile::DirPackage.new( '../../../openfootball/austria' ),
     Datafile::ZipPackage.new( 'tmp/austria-master.zip' )
    ].each do |at|
       assert at.find( '2018-19/.conf.txt' ).read.start_with?( '= Österr. Bundesliga 2018/19' )
    end

    puts "DirPackage:"
    pack = Datafile::DirPackage.new( '../../../openfootball/austria' )
    puts pack.name
    puts "  entries:"
    pack.each( pattern: /\.txt$/ ) do |entry|
      puts entry.name
    end

    puts "ZipPackage:"
    pack = Datafile::ZipPackage.new( 'tmp/austria-master.zip' )
    puts pack.name
    puts "  entries:"
    pack.each( pattern: /\.txt$/ ) do |entry|
      puts entry.name
    end

  end  # method test_read

end  # class TestDatafilePackage
