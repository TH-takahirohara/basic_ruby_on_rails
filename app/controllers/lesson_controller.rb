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

  # フラッシュの実験
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

  # 3.3 テンプレートでインスタンス変数を使う実験
  def step7
    @price = (2000 * 1.08).floor
    # 普通にテンプレートを使うときはrenderメソッドは不要
  end

  # 別のアクションのテンプレートを使う
  def step8
    @price = 1000
    render "step7"
  end

  # HTMLの特殊文字は&lt;などに変換される。
  # -> 検証モードで見てみたが変換されていなかった。ただ、スクリプトは実行されなかった。）
  def step9
    @comment = "<script>alert('危険!')</script>こんにちは。"
  end

  def step10
    @comment = "<strong>安全なHTML</strong>"
  end

  def step11
    @population = 704414
    @surface = 141.31
  end

  def step12
    @time = Time.current
  end

  def step14
    @message = "ごきげんいかが?\nRailsの勉強を頑張りましょう"
  end

  def step17
    @zaiko = 10
  end

  def step18
    @items = { "フライパン" => 2680, "ワイングラス" => 2550, "ペッパーミル" => 4515, "ピーラー" => 945 }
  end
end
