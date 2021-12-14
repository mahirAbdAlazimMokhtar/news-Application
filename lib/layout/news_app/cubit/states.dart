abstract class NewsStates {}

class NewsInitialStates extends NewsStates {}

class NewsBottomNavStates extends NewsStates {}

//this for business states
class NewsGetBusinessLoadingStates extends NewsStates {}

class NewsGetBusinessDataSuccessStates extends NewsStates {}

class NewsGetBusinessDataErrorStates extends NewsStates {
  final String? error;
  NewsGetBusinessDataErrorStates(this.error);
}

//this for sports states
class NewsGetSportsLoadingStates extends NewsStates {}

class NewsGetSportsDataSuccessStates extends NewsStates {}

class NewsGetSportsDataErrorStates extends NewsStates {
  final String? error;
  NewsGetSportsDataErrorStates(this.error);
}

//this for sciences
class NewsGetSciencesLoadingStates extends NewsStates {}

class NewsGetSciencesDataSuccessStates extends NewsStates {}

class NewsGetSciencesDataErrorStates extends NewsStates {
  final String? error;
  NewsGetSciencesDataErrorStates(this.error);
}
