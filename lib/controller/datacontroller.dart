// lib/controllers/git_hub_controller.dart

import 'package:get/get.dart';
import '../model/branchmodel/branch_model.dart';
import '../model/commitmodel/commit_model.dart';
import '../model/organizationmodel/organization_model.dart';
import '../model/repositorymodel/repository_model.dart';
import 'package:logger/logger.dart';

import '../service/network/api_services.dart';

class GitHubController extends GetxController {
  final GitHubApiService _gitHubApiService = GitHubApiService();
  final Logger _logger = Logger();

  // Observable variables
  var organizations = <Organization>[].obs;
  var repositories = <Repository>[].obs;
  var branches = <Branch>[].obs;
  var commits = <Commit>[].obs;

  var isLoading = false.obs;
  var errorMessage = ''.obs;

  // Fetch Organizations
  Future<void> getOrganizations() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      List<Organization> orgs = await _gitHubApiService.fetchOrganizations();
      organizations.assignAll(orgs);
    } catch (e) {
      _logger.e('Error fetching organizations: $e');
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  // Fetch Repositories for a specific Organization
  Future<void> getRepositories(String orgName) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      List<Repository> repos =
      await _gitHubApiService.fetchRepositories(orgName);
      repositories.assignAll(repos);
    } catch (e) {
      _logger.e('Error fetching repositories: $e');
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  // Fetch Branches for a specific Repository
  Future<void> getBranches(String owner, String repo) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      List<Branch> branchList =
      await _gitHubApiService.fetchBranches(owner, repo);
      branches.assignAll(branchList);
    } catch (e) {
      _logger.e('Error fetching branches: $e');
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  // Fetch Commits for a specific Branch
  Future<void> getCommits(String owner, String repo, String branch) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      List<Commit> commitList =
      await _gitHubApiService.fetchCommits(owner, repo, branch);
      commits.assignAll(commitList);
    } catch (e) {
      _logger.e('Error fetching commits: $e');
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
