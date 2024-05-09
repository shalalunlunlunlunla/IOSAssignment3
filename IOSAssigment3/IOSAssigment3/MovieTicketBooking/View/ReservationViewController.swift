//
//  VC_Session.swift
//  MovieTicketBooking
//
//  Created by Natthapat Liawpairoj on 28/4/2567 BE.
//

import UIKit

final class ReservationViewController: UIViewController {
  
  // MARK: - Outlets
  
  @IBOutlet weak private var imageIV: UIImageView!
  @IBOutlet weak private var titleLabel: UILabel!
  @IBOutlet weak private var durationLabel: UILabel!
  @IBOutlet weak private var contentRatingLabel: UILabel!
  @IBOutlet weak private var genreLabel: UILabel!
  @IBOutlet weak private var sessionDaysCV: UICollectionView!
  
  // MARK: - Variables
  
  var movie: Movie?
  private var sessionDays: [Session] = []
  private var selectedSession: Session?
  private var sessionTimes: [String] = []
  private var selectedTime: String?
  
  // MARK: - Lifecycle
  
    override func viewDidLoad() {
        super.viewDidLoad()
        movieDays()
        movieShowtime()
        fillMovieInfo()
        sessionDaysCV.setup("SessionDayCVC", SessionDaysFlowLayout())
      }


  
  // MARK: - Functions Movie Schedule
  
    // Movie Showtime Change to 18.30 followed the FAP Schedule
   
    private func movieDays() {
        var screeningDates: [Date]

        // Safely unwrap the optional movie
        guard let movie = self.movie else {
            print("No movie selected")
            return
        }

        // Retrieve screening dates based on the provided movie title
        switch movie.title {
        case "Pulp Fiction":
            screeningDates = Movie.screeningDatesForPulpFiction()
        case "The God Father":
            screeningDates = Movie.screeningDatesForTheGodFather()
        case "Back To The Future":
            screeningDates = Movie.screeningDatesForBackToTheFuture()
        case "Kill Bill":
            screeningDates = Movie.screeningDatesForKillBill()
        case "Jaws":
            screeningDates = Movie.screeningDatesForJaws()
        case "Forrest Gump":
            screeningDates = Movie.screeningDatesForForrestGump()
        case "Shaw Shank Redemption":
            screeningDates = Movie.screeningDatesForShawShankRedemption()
        case "The Matrix":
            screeningDates = Movie.screeningDatesForTheMatrix()
        default:
            print("Invalid movie title")
            return
        }

        // Debugging: print screening dates to ensure correctness
        print("Screening dates for \(movie.title): \(screeningDates)")

        // Create Session objects for each screening date
        sessionDays = screeningDates.map { Session(date: $0) }

        // Set the selected session to the first one
        selectedSession = sessionDays.first
    }






  // Movie Showtime Change to 18.30 followed the FAP Schedule
    private func movieShowtime() {
        let hour = 18  // 6 PM
        let minute = 30
        let minuteString = String(format: "%02d", minute)
        let time = "\(hour):\(minuteString)"
        sessionTimes.append(time)
    }

  
  private func fillMovieInfo() {
    guard let movie = movie else { return }
    imageIV.image = movie.imageName.loadImageString()
    titleLabel.text = movie.title
    durationLabel.text = movie.durationString()
    contentRatingLabel.text = movie.contentRating.rawValue
    genreLabel.text = movie.genresString()
  }
  
  // MARK: - Actions
  
  @IBAction private func btnChooseSeats_TUI(_ sender: Any) {
    guard let selectedTime = selectedTime else {
      self.showToast("Please choose a session")
      return
    }
    let seatsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SeatsVC") as! SeatsViewController
    seatsVC.movie = movie
    selectedSession?.time = selectedTime
    seatsVC.session = selectedSession
    navigationController?.pushViewController(seatsVC, animated: true)
  }
}

extension ReservationViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    sessionDays.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SessionDayCVC", for: indexPath) as! SessionDayCVC
    let sessionDay = sessionDays[indexPath.row]
    cell.setupCell(session: sessionDay, selected: sessionDay.isIdentical(selectedSession))
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    selectedSession = sessionDays[indexPath.row]
    sessionDaysCV.reloadData()
  }
}

extension ReservationViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { sessionTimes.count }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = Bundle.main.loadNibNamed("SessionTimeTVC", owner: self)?.first as! SessionTimeTVC
    cell.setupCell(time: sessionTimes[indexPath.row])
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    selectedTime = sessionTimes[indexPath.row]
  }
}
