require 'import.rb'

namespace :import_csv do

  # ALLインポート処理
  desc "全てのcsvデータをインポートするタスク"
  task all: :environment do 
    #rakeタスクを呼び出す処理
    Rake::Task["import_csv:user"].invoke
    Rake::Task["import_csv:category"].invoke
    Rake::Task["import_csv:task"].invoke
    Rake::Task["import_csv:comment"].invoke
    # Rake::Task["import_csv:participation"].invoke
  end

  
    #user_dataのインポート処理
      desc "user_data.csvをインポートするタスク"
      task user: :environment do
      
      puts "インポート処理を開始！"
      User.delete_all
      list = Import.csv_data(path: "db/csv_data/user_data.csv")
  
      begin
        User.create!(list)
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

  #categoryのインポート処理
    desc "category_data.csvをインポートするタスク"
    task category: :environment do

    puts "インポート処理を開始！"
    Category.delete_all
    list = Import.csv_data(path: "db/csv_data/category_data.csv")

    begin
      Category.create!(list)
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
    desc "task_data.csvをインポートするタスク"
    task task: :environment do
    
    puts "インポート処理を開始！"
    Task.delete_all
    list = Import.csv_data(path: "db/csv_data/task_data.csv")

    begin
      Task.create!(list)
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




  #comment_dataのインポート処理
    desc "comment_data.csvをインポートするタスク"
    task comment: :environment do

    puts "インポート処理を開始！"
    Comment.delete_all
    list = Import.csv_data(path: "db/csv_data/comment_data.csv")

    begin
      Comment.create!(list)
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


  #participate_dataのインポート処理
    desc "participation_data.csvをインポートするタスク"
    task participation: :environment do
    
    puts "インポート処理を開始！"
    Participation.delete_all
    list = Import.csv_data(path: "db/csv_data/participation_data.csv")

    begin
      Participation.create!(list)
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

end