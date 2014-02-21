import java.util.Date;

/// This class represents a Divvy Bike Trip taken by a single user.
class Trip
{
  Date _startTime; // The trip start time.
  Date _stopTime;   // The trip stop time.

  long _duration; // The duration of the trip in milliseconds.

  Station _fromStation; // The start station id number.
  Station _toStation;   // The stop station id number.

  float _shortestDistance; // the crow-flies distance of the trip.
  float _bearing;  // the crow-flies bearing of the trip.

  String _userType; // Customer or Subscriber

  // These fields are only available if userType == Subscriber
  String _gender;   // Male or Female  
  int _birthYear;   // Year of birth.
  int _age;

  Trip(Trip other)
  {
    
  }

  Trip(Date startTime, 
  Date stopTime, 
  Station fromStation, 
  Station toStation, 
  String userType, 
  String gender, 
  int birthYear)
  {
    _startTime = startTime;
    _stopTime = stopTime;
    _fromStation = fromStation;
    _toStation = toStation;
    _userType = userType;
    _gender = gender;
    _birthYear = birthYear;

    // Calculate several variables.
    _shortestDistance = _fromStation.getShortestDistanceTo(_toStation);
    _bearing = _fromStation.getBearingTo(_toStation);
    _duration = _stopTime.getTime() - _startTime.getTime();
    _age = _birthYear != 0 ? _startTime.getYear() - _birthYear : 0;

  }

  // Accessors ////////////////////////////////////////////////////////////////
  // The member variables are protected by default, allowing only 
  // subclasses of Station to read or write values directly.
  // Accessors like "getId()" give other parts of your code 
  // read-only access to the member variables.

  public Date getStartTime()
  {
    return _startTime;
  }

  public Date getStopTime()
  {
    return _stopTime;
  }

  public Station getFromStation()
  {
    return _fromStation;
  }

  public Station getToStation()
  {
    return _toStation;
  }

  public String getUserType()
  {
    return _userType;
  }

  public int getBirthYear()
  {
    return _birthYear;
  }

  // Calculated variables
  public float getShortestDistance() 
  {
    return _shortestDistance;
  }

  public float getBearing() 
  {
    return _bearing;
  }

  // Return the trip duration in milliseconds
  public float getDuration() 
  {
    return _duration;
  }

  public int getAge()
  {
    return _age;
  }
}
