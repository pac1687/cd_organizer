require 'rspec'
require 'cd'

describe CD do
  it 'initializes a hash with artist and album name' do
    test_cd = CD.new({:artist => "Garth Brooks", :album => "Greatest Hits"})
    expect(test_cd).to be_an_instance_of CD
  end

  it 'adds a cd to organizer' do
    test_cd = CD.new({:artist => "Garth Brooks", :album => "Greatest Hits"})
    test_cd2 = CD.new({:artist => "Mac Brooks", :album => "Greatest Misses"})
    test_cd.cd_add
    test_cd2.cd_add
    expect(CD.all).to eq [test_cd, test_cd2]
  end
end
