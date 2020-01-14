class HardWorker
  include Sidekiq::Worker

  def email_details(worker1, 5)
    @movie = Movie.find(params[:id])
    MovieInfoMailer.send_info(current_user, @movie).deliver
  end

  def movies_csv(worker2, 5)
    file_path = "tmp/movies.csv"
    MovieExporter.new.call(current_user, file_path).deliver
  end

end