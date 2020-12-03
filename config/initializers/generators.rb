Rails.application.config.generators do |g|
  # コントローラとビュー以外のファイルの作成を防ぐ
  g.skip_routes true
  g.assets false
  g.helper false
end
