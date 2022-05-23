class Weather {
  String name = '';
  String description = '';
  double temperature = 0;
  double perceived = 0;
  int pressure = 0;
  int humidity = 0;

  // When called, it will set all these fields using this keyword.
  // This will automatically set the fields with the value you've passed.
  Weather(this.name, this.description, this.temperature, this.perceived,
      this.pressure, this.humidity);
}
