require 'rails_helper'

RSpec.describe Paper, type: :model do
	before do
		@user = FactoryBot.create(:user)
	end

      context "データが正しく保存される" do
        before do
            @paper = Paper.new
            @paper.title = "テストタイトルです"
            @paper.content = "内容です"
            @paper.user_id = 1
            @paper.save
        end
        it "保存" do
            expect(@paper).to be_valid
        end
    end
end
