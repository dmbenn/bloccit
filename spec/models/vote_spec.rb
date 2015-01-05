require 'rails_helper'

describe Vote do

  describe "validations" do

    before do
      @post = create(:post)
    end


    describe "value validation" do
      it "Allows 1 as a value" do
        @vote = @post.votes.create(value: 1)
        expect(@vote.valid?).to eq(true)
      end
      it "Does not allow 2 as a value" do
        @vote = @post.votes.create(value: 2)
        expect(@vote.valid?).to eq(false)
      end
      it "Allows -1 as a value" do
        @vote = @post.votes.create(value: -1)
        expect(@vote.valid?).to eq(true)
      end
      it "Does not allow 0 as a value" do
        @vote = @post.votes.create(value: 0)
        expect(@vote.valid?).to eq(false)
      end
    end

    describe 'after_save' do
    it "calls `Post#update_rank` after save" do
     post = create(:post)
     vote = Vote.new(value: 1, post: post)
     expect(post).to receive(:update_rank)
     vote.save
    end
   end
  end
end