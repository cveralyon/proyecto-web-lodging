module LodgingsHelper

  def beers_purge_watchlist
    session[:watch_list] = "[]"
  end
end
