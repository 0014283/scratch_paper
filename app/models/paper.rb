class Paper < ApplicationRecord

	belongs_to :user
	has_many :likes, dependent: :destroy
	has_many :interests, dependent: :destroy
	has_one :paper_album, dependent: :destroy

	validates :content, presence: true
	validates :user_id, presence: true

	enum genre: { イベント: 1, 映画: 2, 恋愛: 3, 日記: 4, 旅行: 5, アニメ: 6, ゲーム: 7, ニュース: 8, 料理: 9, その他: 10 }

end
