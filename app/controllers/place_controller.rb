class PlaceController < ApplicationController
  DELTA_LAT = 0.01
  DELTA_LNG = 0.01

  def index
    return render :text=>'' , :status=>'422' if params['lat'] == nil || params['lng'] == nil || params['uuid'] == nil
    user = User.find_by_uuid(params['uuid'])
    return render :text=>'' , :status=>'422' if user == nil
    min_lat = params['lat'].to_f - DELTA_LAT
    max_lat = params['lat'].to_f + DELTA_LAT
    min_lng = params['lng'].to_f - DELTA_LNG
    max_lng = params['lng'].to_f + DELTA_LNG
    places = Place.where(['lat > ? AND lat < ? AND lng > ? AND lng < ?',
      min_lat, max_lat, min_lng, max_lng])
    result = []
    places.each do |place|
      up = UserPlace.find_by_user_id_and_place_id(user.id, place.id)
      vs_status = (up == nil) ? 0 : up.vs_status
      place_hash = {
        upid: place.upid,
        icon: place.icon_path,
        pin: place.pin_path,
        name: place.p_name,
        vs_status: vs_status,
        position: {
          lat: place.lat,
          lng: place.lng
        }
      }
      result << place_hash
    end
    respond_to do |format|
     format.json { render :text => result.to_json}
   end
 end

 def update
   return render :text=>'' , :status=>'422' if params['uuid'] == nil || params['upid'] == nil || params['vs_status'] == nil
   place = Place.find_by_upid(params['upid'])
   return render :text=>'' , :status=>'422' if place == nil
   user = User.find_by_uuid(params['uuid'])
   return render :text=>'' , :status=>'422' if user == nil
   up = UserPlace.find_by_user_id_and_place_id(user.id, place.id)
   if up == nil
    UserPlace.create(user_id: user.id, place_id: place.id, vs_status: params['vs_status'].to_i)
   else
    up.update_attributes(vs_status: params['vs_status'].to_i)
   end
   render :text=>'true'
end

def show
  return render :text=>'' , :status=>'422' if params['id'] == nil
  place = Place.find_by_upid(params['id'])
  return render :text=>'' , :status=>'422' if place == nil
  return render :text=>'' , :status=>'422' if params['uuid'] == nil
  user = User.find_by_uuid(params['uuid'])
  return render :text=>'' , :status=>'422' if user == nil
  qas = place.qa_sets.map do |qa|
    {
      question: qa.question,
      answer:[qa.answer_correct, qa.answer_wrong_1, qa.answer_wrong_2]
    }
  end
  player_count = UserPlace.find_all_by_place_id(place.id).count
  respond_to do |format|
   format.json { render :text => {
    total_player: player_count,
    bg: place.bg_path,
    icon: place.icon_path,
    vs_status: place.vs_status(user.id),
    pic: place.get_images,
    info: {
      desc: place.info_desc,
      source: place.info_source,
      link: place.info_link
      },
      weather: YahooYql.new.get_weather,
      qa: qas
      }.to_json}
    end
  end
end
