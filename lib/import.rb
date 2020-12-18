# CSVファイルを扱うときは次が必要
require "csv"

class Import
  def self.csv_data(path:)
    # CSVファイルの（１行目をキーとして）各行のデータを配列に格納する
    # CSVファイルのカラム名と，テーブルのカラム名を一致させておく必要がある
    # row は CSV::Row クラスである。これはモデルの引数として渡せないのでハッシュに変換しておく。
    list = []
    CSV.foreach(path, headers: true) { |row| list << row.to_h }
    list
     
  end

end