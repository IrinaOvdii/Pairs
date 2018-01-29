def index
    render status: 200, json: {
      users: User.all
    }.to_json
  end
