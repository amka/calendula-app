import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:get/get.dart';

import '../appwrite_provider.dart';

class TeamService extends GetxService {
  late final AppwriteProvider provider;
  final teams = <Team>[].obs;
  final currentTeam = Rx<Team?>(null);

  TeamService({required this.provider});

  Future<int> fetchTeams() async {
    final teamList = await provider.teams.list();
    teams.value = teamList.teams;
    if (teamList.total == 1) {
      currentTeam.value = teams.first;
    }
    return teamList.total;
  }

  setCurrentTeam(Team team) => currentTeam.value = team;

  Future<Team> createTeam({required String name, String? teamId}) async {
    final team = await provider.teams.create(
      teamId: teamId ?? ID.unique(),
      name: name,
    );
    teams.add(team);
    currentTeam.value = team;
    return team;
  }

  Future<Preferences> getPrefs({required String teamId}) async {
    return await provider.teams.getPrefs(teamId: teamId);
  }

  Future<Preferences> updatePrefs({
    required String teamId,
    required Map<String, dynamic> prefs,
  }) async {
    return await provider.teams.updatePrefs(
      teamId: teamId,
      prefs: prefs,
    );
  }

  Future<Membership> inviteMember({
    required String teamId,
    required List<String> roles,
    String? email,
    String? phone,
    String? url,
    String? name,
  }) async {
    final membership = await provider.teams.createMembership(
      teamId: teamId,
      roles: roles,
      email: email,
      phone: phone,
      url: url,
      name: name,
    );
    return membership;
  }

  Future<List<Membership>> listMembers({
    required String teamId,
    int perPage = 10,
    int currentPage = 0,
  }) async {
    final memberships = await provider.teams.listMemberships(
      teamId: teamId,
      queries: [Query.limit(perPage), Query.offset(currentPage * perPage)],
    );
    return memberships.memberships;
  }
}
