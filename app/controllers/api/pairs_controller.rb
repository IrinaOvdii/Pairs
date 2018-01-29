def index
    render status: 200, json: {
      pairs: Pair.all
    }.to_json
  end
