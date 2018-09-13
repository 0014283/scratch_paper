class Paper < ApplicationRecord

	belongs_to :user
	has_many :likes, dependent: :destroy
	has_many :interests, dependent: :destroy

	has_many :paper_images, dependent: :destroy
	accepts_nested_attributes_for :paper_images, allow_destroy: true

	validates :content, presence: true
	validates :user_id, presence: true

	enum genre: { イベント: 1, 映画: 2, 恋愛: 3, 日記: 4, 読書: 5, 旅行: 6, アニメ: 7, ゲーム: 8, 音楽: 9, ニュース: 10, 料理: 11, その他: 12 }


	scope :get_by_genre_id, ->(genre_id) { where(genre_id: genre_id) }


	# 日付検索　between(..)で範囲を検索
	scope :start_date_between, -> from, to { where(start_date: from..to)}
	scope :end_date_between, -> from, to { where(end_date: from..to)}

	# from ~ to の外のデータ
	scope :start_date_outside, -> from, to { where('(start_date >= ?)AND(start_date <= ?)', from, to)}
	scope :end_date_outside, -> from, to { where('(end_date >= ?)AND(end_date <= ?)', from, to)}


	# 日付検索　from(start_date)以降のデータを検索
  	scope :get_by_start_date_from, -> from { where('start_date >= ?', from)}
  	# from以降のend_dateを検索
  	scope :get_by_end_date_from, -> from { where('end_date >= ?', from)}

  	# 日付検索　to(end_date)以前のデータを検索
  	scope :get_by_end_date_to, -> to { where('end_date <= ?', to)}
  	# to以前のstart_dateを検索
  	scope :get_by_start_date_to, -> to { where('start_date <= ?', to)}



  	# 一つのフォームで複数のカラムを検索
	scope :get_by_keyword, -> (keyword) { where("(title LIKE :keyword) OR (content LIKE :keyword)", keyword: "%#{sanitize_sql_like(keyword)}%")}

end
