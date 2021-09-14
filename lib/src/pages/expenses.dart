class Expenses {
  final int amount;
  final String categori;
  final String color;

  Expenses(this.amount, this.categori, this.color);

  Expenses.fromMap(Map<String, dynamic> map)
      : assert(map['amount'] != null),
        assert(map['categori'] != null),
        assert(map['color'] != null),
        amount = map['amount'],
        categori = map['categori'],
        color = map['color'];

  @override
  String toString() => "Record<$amount:$categori:$color:>";
}
