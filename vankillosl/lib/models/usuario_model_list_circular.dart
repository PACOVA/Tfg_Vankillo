class UserModelData {
  final String analiticaTipo;
  final int percent, numero;

  const UserModelData({
    required this.analiticaTipo,
    required this.percent,
    required this.numero,
  });
}

final UserModelDataList = [
  const UserModelData(analiticaTipo: 'P.dobles', percent: 49, numero: 160),
  const UserModelData(analiticaTipo: 'Rebotes', percent: 70, numero: 40),
  const UserModelData(analiticaTipo: 'P.triples', percent: 57, numero: 60),
  const UserModelData(analiticaTipo: 'Tapones', percent: 25, numero: 20),
  const UserModelData(analiticaTipo: 'Faltas', percent: 18, numero: 10),
  const UserModelData(analiticaTipo: 'min.played', percent: 60, numero: 120),
];
