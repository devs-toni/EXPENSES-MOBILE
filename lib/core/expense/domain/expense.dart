class Expense {
  String id = '';
  String name = '';

  Expense(this.id, this.name);

  Expense.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
