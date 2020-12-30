class CovidCountryData {
  final int cases;
  final double casesPer100k;
  final int casesPerWeek;
  final int deaths;
  final int recovered;
  final String lastUpdate;
  final int differenceCases;
  final int differenceRecovered;
  final int differenceDeaths;

  CovidCountryData({
    this.cases, 
    this.casesPer100k, 
    this.casesPerWeek,
    this.deaths,
    this.recovered,
    this.lastUpdate,
    this.differenceCases,
    this.differenceRecovered,
    this.differenceDeaths
  });

  factory CovidCountryData.fromJson(Map<String, dynamic> json) {
    return CovidCountryData(
      cases: json['cases'],
      casesPer100k: json['casesPer100k'],
      casesPerWeek: json['casesPerWeek'],
      deaths: json['deaths'],
      recovered: json['recovered'],
      lastUpdate: json['lastUpdate'],
      differenceCases: json['difference']['cases'],
      differenceRecovered: json['difference']['recovered'],
      differenceDeaths: json['difference']['deaths'],
    );
  }
}