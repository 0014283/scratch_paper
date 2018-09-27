class PapersController < ApplicationController

	before_action :authenticate_admin!, only:[:admin_index]
	before_action :authenticate_user!, only:[:new, :create]

	def index
		@papers = Paper.all
		@paper_images = PaperImage.all

		if params[:genre_id].present?
			@papers = @papers.get_by_genre_id params[:genre_id]
		end

		if params[:q].present?
			@papers = @papers.get_by_keyword params[:q]
		end

		# もしfrom(start_date)とto(end_date)が入力された時
		if params[:from].present? && params[:to].present?
			# from ~ to の間のデータ
			@papers_start_between = @papers.start_date_between params[:from],params[:to]
			@papers_end_between = @papers.end_date_between params[:from],params[:to]

			# from ~ to の外のデータ
			@papers_start_outside = @papers.start_date_outside params[:from],params[:to]
			@papers_end_outside = @papers.end_date_outside params[:from],params[:to]

			# 全ての検索結果を合わせる
			@papers = @papers_start_between + @papers_end_between + @papers_start_outside + @papers_end_outside
			# 重複しているデータを取り除く
			@papers = @papers.uniq

		# それともfrom(start_date)のみが入力された時
		elsif params[:from].present?
			@papers_start_from = @papers.get_by_start_date_from params[:from]
			@papers_end_from = @papers.get_by_end_date_from params[:from]

			@papers = @papers_start_from + @papers_end_from
			@papers = @papers.uniq

		# それともto(end_date)のみが入力された時
		elsif params[:to].present?
			@papers_start_to = @papers.get_by_end_date_to params[:to]
			@papers_end_to = @papers.get_by_start_date_to params[:to]

			@papers = @papers_end_to + @papers_start_to
			@papers = @papers.uniq
		end

	end

	def new
		@paper = Paper.new
		@paper.paper_images.build
	end

	def show
		@paper = Paper.find(params[:id])
		@genres = Genre.all
		@paper_images = PaperImage.where(paper_id: @paper.id)
	end

	def create
		@paper = Paper.new(paper_params)
		@user = current_user
		@paper.user_id = @user.id
		if @paper.save
			redirect_to my_list_user_path(@user.id)
		else
			render :new
		end
	end

	def destroy
		@paper = Paper.find(params[:id])
		@user = @paper.user
		if admin_signed_in?
			@paper.destroy
			redirect_to papers_admin_index_path

		elsif @paper.user_id == current_user.id
			@paper.destroy
			redirect_to my_list_user_path(@user.id)
		else
			render :index
		end
	end

	def admin_index
		@papers = Paper.all
		@genres = Genre.all
	end




	private

	def paper_params
		params.require(:paper).permit(:title,:content,:user_id,:genre_id,:start_date,:end_date, paper_images_attributes: [:id, :image, :paper_id, :_destroy, :image_cache_id]
			)
	end
end
