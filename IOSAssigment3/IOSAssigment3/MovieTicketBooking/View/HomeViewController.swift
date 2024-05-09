//
//  VC_Home.swift
//  MovieTicketBooking
//
//  Created by Natthapat Liawpairoj on 27/4/2567 BE.
//

import UIKit

final class HomeViewController: UIViewController {
  // MARK: - Outlets
  
  @IBOutlet weak private var moviesHeader: MovieSlideHeader!
  @IBOutlet weak private var moviesCV: UICollectionView!
  @IBOutlet weak private var upcomingMoviesHeader: MovieSlideHeader!
  @IBOutlet weak private var upcomingMoviesCV: UICollectionView!
  
  // MARK: - Variables
  
  private var movies: [Movie] = []
  private var upcomingMovies: [Movie] = []
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loadMovies()
    loadUpcomingMovies()
    setupCollectionViews()
    configureReusableViewHeaders()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(false, animated: false)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
  }
  
  // MARK: - Functions
  // รายละเอียดหนังเดือน May
    private func loadMovies() {
        movies = [
          Movie(
            image: "PulpFiction",
            title: "Pulp Fiction",
            filmReview: "The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.",
            screeningDates: Movie.screeningDatesForPulpFiction(),
            duration: 154,
            genres: [Genre.Crime, Genre.Drama],
            contentRating: ContentRating.R,
            director: "Quentin Tarantino",
            cast: ["John Travolta", "Uma Thurman", "Samuel L. Jackson"],
            star: 4
          ),
          Movie(
            image: "TheGodFather",
            title: "The God Father",
            filmReview: "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.",
            screeningDates: Movie.screeningDatesForTheGodFather(),
            duration: 175,
            genres: [Genre.Crime, Genre.Drama],
            contentRating: ContentRating.R,
            director: "Francis Ford Coppola",
            cast: ["Marlon Brando", "Al Pacino", "James Caan"],
            star: 3
          ),
          Movie(
            image: "BackToTheFuture",
            title: "Back To The Future",
            filmReview: "Marty McFly, a 17-year-old high school student, is accidentally sent 30 years into the past in a time-traveling DeLorean invented by his close friend, the maverick scientist Doc Brown.",
            screeningDates: Movie.screeningDatesForBackToTheFuture(),
            duration: 116,
            genres: [Genre.Fantasy, Genre.Action],
            contentRating: ContentRating.PG,
            director: "Robert Zemeckis",
            cast: ["Michael J. Fox", "Michael J. Fox", "Lea Thompson"],
            star: 3
          ),
          Movie(
            image: "KillBill",
            title: "Kill Bill",
            filmReview: "After awakening from a four-year coma, a former assassin wreaks vengeance on the team of assassins who betrayed her.",
            screeningDates: Movie.screeningDatesForKillBill(),
            duration: 111,
            genres: [Genre.Crime, Genre.Action, Genre.Thriller],
            contentRating: ContentRating.R,
            director: "Quentin Tarantino",
            cast: ["Uma Thurman", "Uma Thurman", "Daryl Hannah"],
            star: 3
          ),
        ]
      }
    // รายละเอียดหนังเดือน June
      private func loadUpcomingMovies() {
        upcomingMovies = [
          Movie(
            image: "Jaws",
            title: "Jaws",
            filmReview: "When a killer shark unleashes chaos on a beach community off Cape Cod, it's up to a local sheriff, a marine biologist, and an old seafarer to hunt the beast down.",
            screeningDates: Movie.screeningDatesForJaws(),
            duration: 124,
            genres: [Genre.Horror, Genre.Thriller],
            contentRating: ContentRating.R,
            director: "Steven Spielberg",
            cast: ["Roy Scheider", "Robert Shaw", "Richard Dreyfuss"],
            star: 3
          ),
          Movie(
            image: "ForrestGump",
            title: "Forrest Gump",
            filmReview: "The history of the United States from the 1950s to the '70s unfolds from the perspective of an Alabama man with an IQ of 75, who yearns to be reunited with his childhood sweetheart.",
            screeningDates: Movie.screeningDatesForForrestGump(),
            duration: 142,
            genres: [Genre.Drama, Genre.Romance],
            contentRating: ContentRating.R,
            director: "Robert Zemeckis",
            cast: ["Tom Hanks", "Robin Wright", "Gary Sinise"],
            star: 4
          ),
          Movie(
            image: "ShawShankRedemption",
            title: "Shaw Shank Redemption",
            filmReview: "Over the course of several years, two convicts form a friendship, seeking consolation and, eventually, redemption through basic compassion.",
            screeningDates: Movie.screeningDatesForShawShankRedemption(),
            duration: 142,
            genres: [Genre.Drama],
            contentRating: ContentRating.R,
            director: "Frank Darabont",
            cast: ["Tim Robbins", "Morgan Freeman", "Bob Gunton"],
            star: 4
          ),
          Movie(
            image: "TheMatrix",
            title: "The Matrix",
            filmReview: "When a beautiful stranger leads computer hacker Neo to a forbidding underworld, he discovers the shocking truth--the life he knows is the elaborate deception of an evil cyber-intelligence.",
            screeningDates: Movie.screeningDatesForTheMatrix(),
            duration: 142,
            genres: [Genre.Action, Genre.SciFi],
            contentRating: ContentRating.R,
            director: "Lana Wachowski, Lilly Wachowski",
            cast: ["Keanu Reeves", "Laurence Fishburne", "Carrie-Anne Moss"],
            star: 4
          ),
        ]
      }
  
  private func setupCollectionViews() {
    moviesCV.setup("MoviePosterCVC", MoviePostersLayout())
    upcomingMoviesCV.setup("UpcomingMoviePosterCVC", MoviePostersLayout(bottomHeight: 35, imageAspectRatio: 1))
  }
  
  private func configureReusableViewHeaders() {
    moviesHeader.configureView(title: "This Month", onPressed: {self.goToMovies()})
    upcomingMoviesHeader.configureView(title: "Next Month", onPressed: {self.goToMovies(ShowType.Upcoming)})
  }
  
  private func goToMovies(_ showType: ShowType = ShowType.NowShowing) {
    let moviesVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MoviesVC") as! MoviesViewController
    moviesVC.showType = showType
    moviesVC.movies = movies
    moviesVC.upcomingMovies = upcomingMovies
    navigationController?.pushViewController(moviesVC, animated: true)
  }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { collectionView == moviesCV ? movies.count : upcomingMovies.count }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let upcomingMovie: Bool = collectionView == upcomingMoviesCV
    let movie: Movie = upcomingMovie ? upcomingMovies[indexPath.row] : movies[indexPath.row]
    if upcomingMovie {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UpcomingMoviePosterCVC", for: indexPath) as! UpcomingMoviePosterCVC
      cell.setupCell(movie)
      return cell
    } else {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviePosterCVC", for: indexPath) as! MoviePosterCVC
      cell.setupCell(movie)
      return cell
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let movie = collectionView == moviesCV ? movies[indexPath.row] : upcomingMovies[indexPath.row]
    let movieDetailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailVC") as! MovieDetailViewController
    movieDetailVC.movie = movie
    navigationController?.pushViewController(movieDetailVC, animated: true)
  }
}
