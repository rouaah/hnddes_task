class LeaveCount{
  final double maxAnnual;
  final int annual;
  final int sickness;
  final int marriage;
  final int maternity;
  final int workAccident;
  final int death;
  final int unpaid;
  final int others;
  final String hourly;

 const LeaveCount(
      {required this.maxAnnual,
        required this.annual,
        required this.sickness,
        required this.marriage,
        required this.maternity,
        required this.workAccident,
        required this.death,
        required this.unpaid,
        required this.others,
        required this.hourly});


  factory LeaveCount.fromJson(Map<String, dynamic> json) =>LeaveCount(

    maxAnnual:json['maxAnnual'],
    annual: json['annual'],
    sickness:  json['sickness'],
    marriage: json['marriage'],
    maternity: json['maternity'],
    workAccident: json['workAccident'],
    death:  json['death'],
    unpaid: json['unpaid'],
    others: json['others'],
    hourly: json['hourly'],
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maxAnnual'] = this.maxAnnual;
    data['annual'] = this.annual;
    data['sickness'] = this.sickness;
    data['marriage'] = this.marriage;
    data['maternity'] = this.maternity;
    data['workAccident'] = this.workAccident;
    data['death'] = this.death;
    data['unpaid'] = this.unpaid;
    data['others'] = this.others;
    data['hourly'] = this.hourly;
    return data;
  }


}