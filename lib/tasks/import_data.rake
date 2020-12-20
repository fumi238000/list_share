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


   # ALLデリート処理
   desc "全てのデータを削除するタスク"
   task all_delete: :environment do 

    puts "デリート処理を開始！"
    # Participatinn.delete_all
    Comment.delete_all
    Task.delete_all
    Category.delete_all
    User.delete_all
    puts "デリート処理完了！"
   end

  
    #user_dataのインポート処理
      desc "user_data.csvをインポートするタスク"
      task user: :environment do
      
      puts "Userインポート処理を開始！"
      User.delete_all
      list = Import.csv_data(path: "db/csv_data/user_data.csv")
  
      begin
        User.create!(list)
        puts "Userインポート完了！"
      rescue => e
        #例外が発生した時の処理
        puts "#{e.class}: #{e.message}"
        puts "-------------------------"
        puts e.backtrace # 例外が発生した位置情報
        puts "-------------------------"
        puts "Userインポートに失敗"
      end
    end


  #categoryのインポート処理
    desc "category_data.csvをインポートするタスク"
    task category: :environment do

    puts "Categoryインポート処理を開始！"
    Category.delete_all
    list = Import.csv_data(path: "db/csv_data/category_data.csv")

    begin
      Category.create!(list)
      puts "Categoryインポート完了！"
    rescue => e
      #例外が発生した時の処理
      puts "#{e.class}: #{e.message}"
      puts "-------------------------"
      puts e.backtrace # 例外が発生した位置情報
      puts "-------------------------"
      puts "Categoryインポートに失敗"
    end
  end


  #taskのインポート処理
    desc "task_data.csvをインポートするタスク"
    task task: :environment do
    
    puts "Taskインポート処理を開始！"
    Task.delete_all
    list = Import.csv_data(path: "db/csv_data/task_data.csv")

    begin
      Task.create!(list)
      puts "Taskインポート完了！"
    rescue => e
      #例外が発生した時の処理
      puts "#{e.class}: #{e.message}"
      puts "-------------------------"
      puts e.backtrace # 例外が発生した位置情報
      puts "-------------------------"
      puts "Taskインポートに失敗"
    end
  end




  #comment_dataのインポート処理
    desc "comment_data.csvをインポートするタスク"
    task comment: :environment do

    puts "Commentインポート処理を開始！"
    Comment.delete_all
    list = Import.csv_data(path: "db/csv_data/comment_data.csv")

    begin
      Comment.create!(list)
      puts "Commentインポート完了！"
    rescue => e
      #例外が発生した時の処理
      puts "#{e.class}: #{e.message}"
      puts "-------------------------"
      puts e.backtrace # 例外が発生した位置情報
      puts "-------------------------"
      puts "Commentインポートに失敗"
    end
  end


  #participate_dataのインポート処理
    desc "participation_data.csvをインポートするタスク"
    task participation: :environment do
    
    puts "Participationインポート処理を開始！"
    Participation.delete_all
    list = Import.csv_data(path: "db/csv_data/participation_data.csv")

    begin
      Participation.create!(list)
      puts "Participationインポート完了！"
    rescue => e
      #例外が発生した時の処理
      puts "#{e.class}: #{e.message}"
      puts "-------------------------"
      puts e.backtrace # 例外が発生した位置情報
      puts "-------------------------"
      puts "Participationインポートに失敗"
    end
  end 

end