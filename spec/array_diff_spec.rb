require 'array_diff'

describe 'ArrayDiff' do
  before(:each) do
    @subject = ArrayDiff.new
  end

  context 'Atleast one of the input is not an array' do
    it 'throws an error if a is not an array' do
      expect { @subject.exec(1, []) }.to raise_error('Expected array, instead recieved 1')
    end

    it 'throws an error if b is not an array' do
      expect { @subject.exec([], 3) }.to raise_error('Expected array, instead recieved 3')
    end
  end

  context 'Atleast one of the arrays is empty' do
    it 'results in empty array if both arrays are empty' do
      res = @subject.exec([], [])
      expect(res).to eq []
    end

    it 'results in the first array if second array is empty'  do
      expect(@subject.exec([1], [])).to eq [1]
    end

    it 'results in the first array if the first array is empty' do
      expect(@subject.exec([], [1])).to eq [1]
    end
  end

  context 'Receives two non empty arrays' do
    it 'returns [3] when given [1,2,3] and [1,2]' do
      expect(@subject.exec([1,2, 3], [1,2])).to eq [3]
    end

    it 'returns [3] when given [1,2] and [1,2,3]' do
      expect(@subject.exec([1,2], [1,2,3])).to eq [3]
    end

    it 'returns [] when given [1,2] and [1,2]' do
      expect(@subject.exec([1,2], [1,2])).to eq []
    end

    it 'returns [1, 2, 3, 4, 5, 6] when given [1,2,3] and [4,5,6]' do
      expect(@subject.exec([1,2,3], [4,5,6])).to eq [1,2,3,4,5,6]
    end
  end
end
