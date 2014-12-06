describe Vote do
  describe "validations" do
    
    before do
      @vote1 = Vote.create(value: 1)
      @vote2 = Vote.create(value: 2)
      @vote3 = Vote.create(value: -1)
      @vote4 = Vote.create(value: 0)
    end


    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect(@vote1).to eq(true)
        expect(@vote2).to eq(false)
        expect(@vote3).to eq(true)
        expect(@vote4).to eq(false)
      end
    end
  end
end