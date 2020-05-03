class Matches {
  int matchId;
  int playerSlot;
  bool radiantWin;
  int duration;
  int gameMode;
  int lobbyType;
  int heroId;
  int startTime;
  int version;
  int kills;
  int deaths;
  int assists;
  int skill;
  int leaverStatus;
  int partySize;

  Matches(
      {this.matchId,
      this.playerSlot,
      this.radiantWin,
      this.duration,
      this.gameMode,
      this.lobbyType,
      this.heroId,
      this.startTime,
      this.version,
      this.kills,
      this.deaths,
      this.assists,
      this.skill,
      this.leaverStatus,
      this.partySize});

  Matches.fromJson(Map<String, dynamic> json) {
    matchId = json['match_id'];
    playerSlot = json['player_slot'];
    radiantWin = json['radiant_win'];
    duration = json['duration'];
    gameMode = json['game_mode'];
    lobbyType = json['lobby_type'];
    heroId = json['hero_id'];
    startTime = json['start_time'];
    version = json['version'];
    kills = json['kills'];
    deaths = json['deaths'];
    assists = json['assists'];
    skill = json['skill'];
    leaverStatus = json['leaver_status'];
    partySize = json['party_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['match_id'] = this.matchId;
    data['player_slot'] = this.playerSlot;
    data['radiant_win'] = this.radiantWin;
    data['duration'] = this.duration;
    data['game_mode'] = this.gameMode;
    data['lobby_type'] = this.lobbyType;
    data['hero_id'] = this.heroId;
    data['start_time'] = this.startTime;
    data['version'] = this.version;
    data['kills'] = this.kills;
    data['deaths'] = this.deaths;
    data['assists'] = this.assists;
    data['skill'] = this.skill;
    data['leaver_status'] = this.leaverStatus;
    data['party_size'] = this.partySize;
    return data;
  }

  @override
  String toString() {
    return 'Matches(matchId: $matchId, playerSlot: $playerSlot, radiantWin: $radiantWin, duration: $duration, gameMode: $gameMode, lobbyType: $lobbyType, heroId: $heroId, startTime: $startTime, version: $version, kills: $kills, deaths: $deaths, assists: $assists, skill: $skill, leaverStatus: $leaverStatus, partySize: $partySize)';
  }
}
