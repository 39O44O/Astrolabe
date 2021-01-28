class ResumeController < ApplicationController
  before_action :authenticate_user!
  before_action :set_resume, only: %i(show edit create update)
  
  def new
    @resume = Resume.new
  end
  
  def create
    @resume = Resume.new(resume_params)
    if @resume.save
      redirect_to :top_menu
      flash[:notice] = "作成しました。"
    else
      reder action: :new
      flash[:alert] = "失敗しました。"
    end
  end

  def show
    @user = User.find(params[:id])
  end
  
  
  def edit
    @user = User.find(params[:id])
    @resume = User.find(params[:id])
  end
  
  def update
    if @resume.update(resume_params)
      redirect_to :top_menu
    else
      render action: :edit
    end
  end

  private
    def resume_params
      params.permit(:name).merge(user_id: current_user.id)
    end
    
    # paramsとは送られてきたリクエスト情報をひとまとめにしたもの
    # requireで受け取る値のキーを設定する
    # permitで変更を加えられるキーを設定する
    # mergeメソッドは2つのハッシュを統合するメソッド
    
    def set_resume
      @resume = Resume.find_by(id: params[:id])
    end
end
