class VisitorsController < ApplicationController

  def new
return render :text => Place.first.get_images.inspect
    result = []
    result << User.all.map { |u| "#{u.inspect}\n" }.join
    result << UserPlace.all.map { |up| "#{up.inspect}\n" }.join
    result << Place.all.map { |p| "#{p.inspect}\n" }.join
    result << QaSet.all.map { |qa| "#{qa.inspect}\n" }.join
    render :text => result.join("\n")
  end

  #   render :text=>YahooYql.new.get_weather().to_json
  # end

end
