Geocoder.configure(

    # street address geocoding service (default :nominatim)
    lookup: :google,

    # geocoding service request timeout, in seconds (default 3):
    timeout: 5,
    api_key: ENV["API_KEY"],
    # set default units to miles:
    units: :miles,

  )
