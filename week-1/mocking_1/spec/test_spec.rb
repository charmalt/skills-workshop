require 'test'
# require 'answer'

describe Test do


  let(:answer) { double :answer, correct?: true}

  let(:answers) do
    [
      answer,
      answer,
      answer
    ]
  end

  subject(:test) { Test.new(Date.today, answers) }

  describe '#pretty_date_taken' do
    it 'returns the date the test was taken, as a string' do
      expect(test.pretty_date_taken).to eq Date.today.to_s
    end
  end

  describe '#score' do
    it 'returns the number of correct answers' do
      expect(test.score).to eq 3
    end
  end
end
