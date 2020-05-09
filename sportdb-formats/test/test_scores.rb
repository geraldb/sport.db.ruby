# encoding: utf-8

###
#  to run use
#     ruby -I ./lib -I ./test test/test_scores.rb


require 'helper'

class TestScores < MiniTest::Test

  def test_de
    ScoreFormats.lang = :de
    data = [
      [ '10:0',  [nil,nil,10,0]],
      [ '1:22',  [nil,nil,1,22]],
      [ '1-22',  [nil,nil,1,22]],

      ## do not support three digits for now - why? why not?
      [ '1:222', []],
      [ '111:0', []],
      [ '1-222', []],
      [ '111-0', []],

      [ '2:2 (1:1, 1:0) n.V. 5:1 i.E.',  [1,0,1,1,2,2,5,1]],
      [ '2:2 (1:1, 1:0) n.V.',           [1,0,1,1,2,2]],
      [ '2:2 (1:1, ) n.V. 5:1 i.E.',     [nil,nil,1,1,2,2,5,1]],
      [ '2:2 (1:1, ) n.V.',              [nil,nil,1,1,2,2]],

      [ '2:2 (1:1) n.V. 5:1 i.E.',       [nil,nil,1,1,2,2,5,1]],
      [ '2:2 (1:1) n.V.',                [nil,nil,1,1,2,2]],

      [ '2-2 (1-1, 1-0) n.V. 5-1 i.E.',  [1,0,1,1,2,2,5,1]],
      [ '2-2 (1-1, 1-0) n.V.',           [1,0,1,1,2,2]],
      [ '2-2 (1-1, ) n.V. 5-1 i.E.',     [nil,nil,1,1,2,2,5,1]],
      [ '2-2 (1-1, ) n.V.',              [nil,nil,1,1,2,2]],

      [ '2 : 2 ( 1 : 1 , 1 : 0 ) n.V. 5 : 1 i.E.',  [1,0,1,1,2,2,5,1]],
      [ '2 : 2 ( 1 : 1 , 1 : 0 ) n.V.',             [1,0,1,1,2,2]],
      [ '2 : 2 ( 1 : 1 , ) n.V. 5 : 1 i.E.',        [nil,nil,1,1,2,2,5,1]],
      [ '2 : 2 ( 1 : 1 , ) n.V.',                   [nil,nil,1,1,2,2]],
    ]

    assert_score( data )
  end

  def test_en
    ScoreFormats.lang = :en

    data = [
     [ '1-22',  [nil,nil,1,22]],
     [ '1x22',  [nil,nil,1,22]],
     [ '1X22',  [nil,nil,1,22]],

     ## do not support three digits for now - why? why not?
     [ '1-222', []],
     [ '111-0', []],
     [ '111x0', []],
     [ '111X0', []],

     ## do not support colon sep for now in en locale - why? why not?
     [ '2:1',       []],
     [ '2:1 (1:1)', []],


     [ '2-1 (1-1)', [1,1,2,1]],
     [ '2x1 (1x1)', [1,1,2,1]],
     [ '2X1 (1X1)', [1,1,2,1]],

     [ '2-1 a.e.t. (1-1, 0-0)', [0,0,1,1,2,1]],
     [ '2-1aet (1-1, 0-0)', [0,0,1,1,2,1]],
     [ '2-1 A.E.T. (1-1, 0-0)', [0,0,1,1,2,1]],
     [ '2-1AET (1-1, 0-0)', [0,0,1,1,2,1]],

     [ '3-4 pen. 2-2 a.e.t. (1-1, 1-1)', [1,1,1,1,2,2,3,4]],
     [ '3-4 pen 2-2 a.e.t. (1-1, 1-1)', [1,1,1,1,2,2,3,4]],
     [ '3-4 pen 2-2 a.e.t. (1-1, 1-1)', [1,1,1,1,2,2,3,4]],
     [ '3-4p 2-2aet (1-1, 1-1)', [1,1,1,1,2,2,3,4]],
     [ '3-4PSO 2-2AET (1-1, 1-1)', [1,1,1,1,2,2,3,4]],

     [ '4-3 pen. 1-0 a.e.t. (1-0, )', [nil,nil,1,0,1,0,4,3]],
     [ '3-4 pen. 2-1 a.e.t. (2-1, )', [nil,nil,2,1,2,1,3,4]],
     [ '4-1 a.e.t. (3-1, )',          [nil,nil,3,1,4,1]],
     [ '3-4aet (1-1,)',               [nil,nil,1,1,3,4]],
     [ '3-4 a.e.t. (1-1,)',           [nil,nil,1,1,3,4]],

     [ '4-3 pen. 1-0 a.e.t. (1-0)', [nil,nil,1,0,1,0,4,3]],
     [ '3-4 pen. 2-1 a.e.t. (2-1)', [nil,nil,2,1,2,1,3,4]],
     [ '4-1 a.e.t. (3-1)',          [nil,nil,3,1,4,1]],
     [ '3-4aet (1-1)',               [nil,nil,1,1,3,4]],
     [ '3-4 a.e.t. (1-1)',           [nil,nil,1,1,3,4]],

     [ '3-1 pen (1-1)',               [nil,nil,1,1, nil, nil, 3,1]],

     ## try with more "liberal" spaces
     [ '2 - 1 ( 1 - 1 )',                [1,1,2,1]],
     [ '2 - 1 a.e.t. ( 1 - 1 , 0 - 0 )', [0,0,1,1,2,1]],
     [ '4 - 1 a.e.t. ( 3 - 1, )',        [nil,nil,3,1,4,1]],
   ]

    assert_score( data )
  end

private
  def assert_score( data )
    data.each do |rec|
      line = rec[0].dup
      exp  = rec[1]

      assert_equal exp, ScoreFormats.find!( line ).to_a, "failed >#{rec[0]}< - >#{line}<"
    end
  end
end # class TestScores
