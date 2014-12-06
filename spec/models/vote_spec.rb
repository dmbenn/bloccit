require 'rails_helper'

describe Vote do
  describe "validations" do
    
    before do
      @post = Post.create(title: 'testing', body: 'has to be at least 20 chars long')
      @vote1 = @post.votes.create(value: 1)
      @vote2 = @post.votes.create(value: 2)
      @vote3 = @post.votes.create(value: -1)
      @vote4 = @post.votes.create(value: 0)
    end


    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect(@vote1.valid?).to eq(true)
        expect(@vote2.valid?).to eq(false)
        expect(@vote3.valid?).to eq(true)
        expect(@vote4.valid?).to eq(false)
      end
    end
  end
end