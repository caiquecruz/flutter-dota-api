class Account {
  int accountId;
  String personaname;
  String avatarfull;
  String lastMatchTime;
  double similarity;

  Account(
      {this.accountId,
      this.personaname,
      this.avatarfull,
      this.lastMatchTime,
      this.similarity});

  Account.fromJson(Map<String, dynamic> json) {
    accountId = json['account_id'];
    personaname = json['personaname'];
    avatarfull = json['avatarfull'];
    lastMatchTime = json['last_match_time'];
    similarity = json['similarity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_id'] = this.accountId;
    data['personaname'] = this.personaname;
    data['avatarfull'] = this.avatarfull;
    data['last_match_time'] = this.lastMatchTime;
    data['similarity'] = this.similarity;
    return data;
  }

  @override
  String toString() {
    return 'Account(accountId: $accountId, personaname: $personaname, avatarfull: $avatarfull, lastMatchTime: $lastMatchTime, similarity: $similarity)';
  }
}
