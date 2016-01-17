class DummyController < ActionController::Base
  def dummy
    render text: I18n.locale
  end

  def show
    # Pass
  end

  def optional
    # Pass
  end

  def suffix
    # Pass
    render text: params[:id]
  end

  def native
    render text: show_path
  end

  def engine
    render text: blorgh.posts_path
  end
end
