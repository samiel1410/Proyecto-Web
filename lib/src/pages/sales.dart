class Sales {
  final int amount;
  final String categori;

  Sales(this.amount,this.categori);

  Sales.fromMap(Map<String, dynamic> map)
      : assert(map['amount'] != null),
        assert(map['categori'] != null),
   
        amount = map['amount'],
        categori=map['categori'];

  @override
  String toString() => "Record<$amount:$categori:>";
}