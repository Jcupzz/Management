class Branch_Model {
  String lottie_name;
  String branch_name;

  Branch_Model(this.lottie_name, this.branch_name);

  @override
  String toString() {
    return '{ ${this.lottie_name}, ${this.branch_name} }';
  }
}