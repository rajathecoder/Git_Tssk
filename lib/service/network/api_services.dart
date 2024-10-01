import 'dart:convert';
import 'package:github_mobile_app/service/network/url_services.dart';
import 'package:http/http.dart' as http;
import '../../model/branchmodel/branch_model.dart';
import '../../model/commitmodel/commit_model.dart';
import '../../model/organizationmodel/organization_model.dart';
import '../../model/repositorymodel/repository_model.dart';
import 'auth_services.dart';
import 'package:logger/logger.dart';

class GitHubApiService {
  final AuthService _authService = AuthService();
  final Logger _logger = Logger();

  Future<List<Organization>> fetchOrganizations() async {
    final token = await _authService.getGitHubToken();
    if (token == null) {
      _logger.e('GitHub access token not found.');
      throw Exception('GitHub access token not found.');
    }

    final response = await http.get(
      Uri.parse('${UrlService.BaseUrl}/user/orgs'),
      headers: {
        'Authorization': 'token $token',
        'Accept': 'application/vnd.github.v3+json',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> orgsJson = json.decode(response.body);
      return orgsJson.map((json) => Organization.fromJson(json)).toList();
    } else {
      _logger.e(
          'GitHub API Error (Organizations): ${response.statusCode}');
      _logger.e('Response Body: ${response.body}');
      throw Exception('Failed to load organizations');
    }
  }

  Future<List<Repository>> fetchRepositories(String orgName) async {
    final token = await _authService.getGitHubToken();
    if (token == null) {
      _logger.e('GitHub access token not found.');
      throw Exception('GitHub access token not found.');
    }

    final response = await http.get(
      Uri.parse('${UrlService.BaseUrl}/orgs/$orgName/repos'),
      headers: {
        'Authorization': 'token $token',
        'Accept': 'application/vnd.github.v3+json',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> reposJson = json.decode(response.body);
      return reposJson.map((json) => Repository.fromJson(json)).toList();
    } else {
      _logger.e(
          'GitHub API Error (Repositories): ${response.statusCode}');
      _logger.e('Response Body: ${response.body}');
      throw Exception('Failed to load repositories');
    }
  }

  Future<List<Branch>> fetchBranches(String owner, String repo) async {
    final token = await _authService.getGitHubToken();
    if (token == null) {
      _logger.e('GitHub access token not found.');
      throw Exception('GitHub access token not found.');
    }

    final response = await http.get(
      Uri.parse('${UrlService.BaseUrl}/repos/$owner/$repo/branches'),
      headers: {
        'Authorization': 'token $token',
        'Accept': 'application/vnd.github.v3+json',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> branchesJson = json.decode(response.body);
      return branchesJson.map((json) => Branch.fromJson(json)).toList();
    } else {
      _logger.e('GitHub API Error (Branches): ${response.statusCode}');
      _logger.e('Response Body: ${response.body}');
      throw Exception('Failed to load branches');
    }
  }

  // Fetch Commits for a Branch
  Future<List<Commit>> fetchCommits(
      String owner, String repo, String branch) async {
    final token = await _authService.getGitHubToken();
    if (token == null) {
      _logger.e('GitHub access token not found.');
      throw Exception('GitHub access token not found.');
    }

    final response = await http.get(
      Uri.parse(
          '${UrlService.BaseUrl}/repos/$owner/$repo/commits?sha=$branch'),
      headers: {
        'Authorization': 'token $token',
        'Accept': 'application/vnd.github.v3+json',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> commitsJson = json.decode(response.body);
      return commitsJson.map((json) => Commit.fromJson(json)).toList();
    } else {
      _logger.e('GitHub API Error (Commits): ${response.statusCode}');
      _logger.e('Response Body: ${response.body}');
      throw Exception('Failed to load commits');
    }
  }
}
