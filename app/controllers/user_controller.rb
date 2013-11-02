class UserController < ApplicationController
  def create
    return render :text=>'' , :status=>'422' if params['name'] == nil
    user = User.new(u_name: params['name'])
    if user.save
      { uuid: user.uuid }.to_json
    else
      return render :text=>'' ,:status=>'422'
    end
    respond_to do |format|
      format.json { render :text => { uuid: user.uuid }.to_json }
    end
  end

  def show
    return render :text=>'' , :status=>'422'  if params[:id] == nil
    user = User.find_by_uuid(params[:id])
    return render :text=>'' , :status=>'422' unless user
    respond_to do |format|
      format.json {render :text => { name: user.u_name }.to_json }
    end
  end
end
