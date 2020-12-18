require 'import.rb'

namespace :import_csv do

  # ALLインポート処理
  desc "全てのcsvデータをインポートするタスク"
  task all: :environment do 
    #rakeタスクを呼び出す処理
    Rake::Task["import_csv:aws_text"].invoke
    Rake::Task["import_csv:movie"].invoke
    Rake::Task["import_csv:line"].invoke
    Rake::Task["import_csv:text"].invoke
    Rake::Task["import_csv:question"].invoke
  end



  #categoryのインポート処理
    desc "categoryの初期データを導入する"
    task category: :environment do

    puts "インポート処理を開始！"
    list = Import.csv_data(path: "db/csv_data/category_data.csv")
    Category.delete_all

    begin
      AwsText.create!(list)
      puts "インポート完了！"
    rescue => e
      #例外が発生した時の処理
      puts "#{e.class}: #{e.message}"
      puts "-------------------------"
      puts e.backtrace # 例外が発生した位置情報
      puts "-------------------------"
      puts "インポートに失敗"
    end
  end


  #taskのインポート処理
    desc "taskの初期データを導入する"
    task task: :environment do
    
    puts "インポート処理を開始！"
    Task.delete_all
    list = Import.csv_data(path: "db/csv_data/task_data.csv")

    begin
      Movie.create!(list)
      puts "インポート完了！"
    rescue => e
      #例外が発生した時の処理
      puts "#{e.class}: #{e.message}"
      puts "-------------------------"
      puts e.backtrace # 例外が発生した位置情報
      puts "-------------------------"
      puts "インポートに失敗"
    end
  end


  # #line_dataのインポート処理
  #   desc "line_data.csvをインポートするタスク"
  #   task line: :environment do
    
  #     puts "インポート処理を開始！"
  #   Line.delete_all
  #   list = Import.csv_data(path: "db/csv_data/line_data.csv")

  #   begin
  #     Line.create!(list)
  #     puts "インポート完了！"
  #   rescue => e
  #     #例外が発生した時の処理
  #     puts "#{e.class}: #{e.message}"
  #     puts "-------------------------"
  #     puts e.backtrace # 例外が発生した位置情報
  #     puts "-------------------------"
  #     puts "インポートに失敗"
  #   end
  # end


  # #text_dataのインポート処理
  #   desc "text_data.csvをインポートするタスク"
  #   task text: :environment do

  #   puts "インポート処理を開始！"
  #   Text.delete_all
  #   list = Import.csv_data(path: "db/csv_data/text_data.csv")

  #   begin
  #     Text.create!(list)
  #     puts "インポート完了！"
  #   rescue => e
  #     #例外が発生した時の処理
  #     puts "#{e.class}: #{e.message}"
  #     puts "-------------------------"
  #     puts e.backtrace # 例外が発生した位置情報
  #     puts "-------------------------"
  #     puts "インポートに失敗"
  #   end
  # end


  # #question_dataのインポート処理
  #   desc "question_data.csvをインポートするタスク"
  #   task question: :environment do
    
  #   puts "インポート処理を開始！"
  #   Question.delete_all
  #   list = Import.csv_data(path: "db/csv_data/question_data.csv")

  #   begin
  #     Question.create!(list)
  #     puts "インポート完了！"
  #   rescue => e
  #     #例外が発生した時の処理
  #     puts "#{e.class}: #{e.message}"
  #     puts "-------------------------"
  #     puts e.backtrace # 例外が発生した位置情報
  #     puts "-------------------------"
  #     puts "インポートに失敗"
  #   end
  # end 

end