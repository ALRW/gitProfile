githubUserSearch.factory('Search', ['$http', function($http){
  var queryUrl = '/search';

  return {
    query: function(searchTerm) {
      return $http({
        url: queryUrl,
        method: 'GET',
        params: {
          'username': searchTerm
        }
      });
    }
  };
}]);
