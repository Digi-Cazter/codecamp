class EditorsController < ApplicationController
  # /editor/groups/:id
  def group
    ether = EtherpadLite.connect(9001, "6LrsHQEEUwHMR6a8P7EMdcxnvXrbRVLP")
    @interviews = Interview.find(params[:id])
    # Map your app's group to an EtherpadLite Group, and list all its pads
    group = ether.group("interviews_#{@interviews.id}")
    @pads = group.pads
  end

  # /editor/pads/:ep_group_id/:ep_pad_name
  def pad  
  	session[:ep_sessions] = {}
    ether = EtherpadLite.connect(9001, "6LrsHQEEUwHMR6a8P7EMdcxnvXrbRVLP")
    # Get the EtherpadLite Group and Pad by id
    #@group = ether.get_group(params[:interview_id])
    @group = ether.group("interviews_#{params[:interview_id]}")   
    @pad = @group.pad(params[:ep_pad_name])
    # Map the user to an EtherpadLite Author
    author = ether.author("interview_#{params[:interview_id]}", :name => Candidate.find(params[:candidate_id]).full_name)
    # Get or create an hour-long session for this Author in this Group
    sess = @group.create_session(author, 60)
    if sess.expired?
      sess.delete
      sess = @group.create_session(author, 60)
    end
    session[:ep_sessions][@group.id] = sess.id
    # Set the EtherpadLite session cookie. This will automatically be picked up by the jQuery plugin's iframe.
    cookies[:sessionID] = {:value => sess.id, :domain => ".onyx"}
  end

  def run
  	api_key = params[:apikey]
  	pad_id = params[:padID]
  	# Get code from etherpad lite server passing in the api key and padID
  	# request = Curl.get("http://localhost:9001/api/1/getText?apikey=#{params[:apikey]}padID=#{params[:padID]}")
  	request = "http://localhost:9001/api/1/getText?apikey=6LrsHQEEUwHMR6a8P7EMdcxnvXrbRVLP&padID=g.N3w0xfzLwpJyvsJd"
  	# code = JSON.parse(request.body_str)["data"]["text"]
  	# lines = code.split("\n")
  	# output = Sandrbox.perform(lines).output
  	respond_to do |format|
  		format.js{ render 'editors/run' }
  	end
  end
end