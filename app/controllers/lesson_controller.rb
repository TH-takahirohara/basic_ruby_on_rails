class LessonController < ApplicationController
  def step1
    render plain: "こんにちは、#{params[:name]}さん"
  end

  # paramsの実験
  def step2
    render plain: params[:controller] + "#" + params[:action]
  end

  # リダイレクトの実験
  def step3
    redirect_to action: "step4"
  end

  def step4
    render plain: "step4に移動しました。"
  end

  ## フラッシュの実験
  def step5
    flash[:notice] = "step6に移動します"
    redirect_to action: "step6"
    # フラッシュの名前が:noticeまたは:alertの場合、redirect_toメソッドの第2引数にハッシュを加えて
    # リダイレクションとフラッシュの設定を同時に行うこともできる。下記例
    # redirect_to "/lesson/step6", notice: "step6に移動します"
  end

  def step6
    render plain: flash[:notice]
  end
end
