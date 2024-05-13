//
//  VC_Home.swift
//  MovieTicketBooking
//
//  Created by Natthapat Liawpairoj on 27/4/2567 BE.
//

import UIKit

final class HomeViewController: UIViewController {
  // MARK: - Outlets
  
    @IBOutlet weak private var moviesCV: UICollectionView!
    @IBOutlet weak var moviesCVHeight: NSLayoutConstraint!
    @IBOutlet weak private var upcomingMoviesHeader: MovieSlideHeader!
    @IBOutlet weak private var upcomingMoviesCV: UICollectionView!
    @IBOutlet weak var nextMonthMoviesHeader: MovieSlideHeader!
    @IBOutlet weak var nextMonthMoviesCV: UICollectionView!
    
  // MARK: - Variables
  
  private var movies: [Movie] = []
  private var upcomingMovies: [Movie] = []
  private var banner: [Banner] = []
  private var bannerTimer: Timer?
  private var currentBannerIndex = 0

  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loadBanner()
    loadMovies()
    loadUpcomingMovies()
    setupCollectionViews()
    configureReusableViewHeaders()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(false, animated: false)
    startBannerTimer()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    stopBannerTimer()
  }
    
  deinit {
    stopBannerTimer()
  }
  
  // MARK: - Functions
    
    private func loadBanner() {
            banner = [
                Banner(image: "banner1", title: "Movie Trivia Night"),
                Banner(image: "banner2", title: "Short Film Night"),
                Banner(image: "banner3", title: "Movie Night: All That Jazz")
            ]
        }
    
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
            cast: ["John Travolta", "Uma Thurman", "Samuel L. Jackson"]
          ),
          Movie(
            image: "TheGodfather",
            title: "The Godfather",
            filmReview: "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.",
            screeningDates: Movie.screeningDatesForTheGodfather(),
            duration: 175,
            genres: [Genre.Crime, Genre.Drama],
            contentRating: ContentRating.R,
            director: "Francis Ford Coppola",
            cast: ["Marlon Brando", "Al Pacino", "James Caan"]
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
            cast: ["Michael J. Fox", "Michael J. Fox", "Lea Thompson"]
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
            cast: ["Uma Thurman", "Uma Thurman", "Daryl Hannah"]
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
            cast: ["Roy Scheider", "Robert Shaw", "Richard Dreyfuss"]
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
            cast: ["Tom Hanks", "Robin Wright", "Gary Sinise"]
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
            cast: ["Tim Robbins", "Morgan Freeman", "Bob Gunton"]
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
            cast: ["Keanu Reeves", "Laurence Fishburne", "Carrie-Anne Moss"]
          ),
        ]
      }
  
  private func setupCollectionViews() {
      let width = UIScreen.main.bounds.width
      let height = width * (3/5)
      
      //banner
      moviesCVHeight.constant = height
      let flowLayout = UICollectionViewFlowLayout()
      flowLayout.itemSize = CGSize(width: width, height: height)
      flowLayout.scrollDirection = .horizontal
      flowLayout.minimumInteritemSpacing = 10
    moviesCV.setup("MoviePosterCVC", flowLayout)
      //
      
      //this month
    upcomingMoviesCV.setup("UpcomingMoviePosterCVC", MoviePostersLayout(bottomHeight: 0, imageAspectRatio: 3/4))
      //next month
      nextMonthMoviesCV.setup("UpcomingMoviePosterCVC", MoviePostersLayout(bottomHeight: 0, imageAspectRatio: 3/4))
  }
  
  private func configureReusableViewHeaders() {
    upcomingMoviesHeader.configureView(title: "This Month", onPressed: {self.goToMovies(ShowType.NowShowing)})
      nextMonthMoviesHeader.configureView(title: "Next Month", onPressed: {self.goToMovies(ShowType.Upcoming)})
  }
  
  private func goToMovies(_ showType: ShowType = ShowType.NowShowing) {
    let moviesVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MoviesVC") as! MoviesViewController
    moviesVC.showType = showType
    moviesVC.movies = movies
    moviesVC.upcomingMovies = upcomingMovies
    navigationController?.pushViewController(moviesVC, animated: true)
  }
    private func startBannerTimer() {
        bannerTimer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(scrollToNextBanner), userInfo: nil, repeats: true)
    }

    private func stopBannerTimer() {
        bannerTimer?.invalidate()
        bannerTimer = nil
    }

    @objc private func scrollToNextBanner() {
        guard !banner.isEmpty else { return }
        currentBannerIndex = (currentBannerIndex + 1) % banner.count
        let indexPath = IndexPath(item: currentBannerIndex, section: 0)
        moviesCV.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
      }
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      switch collectionView {
      case upcomingMoviesCV:
        return movies.count
      case nextMonthMoviesCV:
        return upcomingMovies.count
      default:
        return banner.count
      }
    }
  
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      switch collectionView {
      case upcomingMoviesCV:
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UpcomingMoviePosterCVC", for: indexPath) as? UpcomingMoviePosterCVC else { return UICollectionViewCell() }
        cell.setupCell(movies[indexPath.row])
        return cell
      case nextMonthMoviesCV:
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UpcomingMoviePosterCVC", for: indexPath) as? UpcomingMoviePosterCVC else { return UICollectionViewCell() }
        cell.setupCell(upcomingMovies[indexPath.row])
        return cell
      default:
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviePosterCVC", for: indexPath) as? MoviePosterCVC else { return UICollectionViewCell() }
        cell.setupCell(with: banner[indexPath.row])
        return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == upcomingMoviesCV {
          let movieDetailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailVC") as! MovieDetailViewController
          movieDetailVC.movie = movies[indexPath.row]
          navigationController?.pushViewController(movieDetailVC, animated: true)
        } else if collectionView == nextMonthMoviesCV {
          let movieDetailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailVC") as! MovieDetailViewController
          movieDetailVC.movie = upcomingMovies[indexPath.row]
          navigationController?.pushViewController(movieDetailVC, animated: true)
        }
    }
  }
