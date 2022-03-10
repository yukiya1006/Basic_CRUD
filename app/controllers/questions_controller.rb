class QuestionsController < ApplicationController
  #質問の一覧
  def index
    @questions = Question.all
  end

  #質問の詳細
  def show
    @question = Question.find(params[:id])

  end

  #質問の作成
  def new
    @question = Question.new
  end

  #質問の登録
  def create
    #Questionモデルを初期化
    @question = Question.new(question_params)
       #QuestionモデルをDBへ保存
    if @question.save
       #showへリダイレクト
      redirect_to @question
    else
      #保存できなかったらnewへ遷移
      render 'new'
    end
  end

  #質問の編集
  def edit
    @question = Question.find(params[:id])
  end
  
  #質問の更新
  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  #質問の削除
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private
  def question_params
    params.require(:question).permit(:title, :name, :content)
  end
end
